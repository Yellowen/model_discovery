module ModelDiscovery

  # Create a list of current rails application tables or documents
  def self.build_table_list(without_habtm = true)
    # Get all gem by requiring them
    all_gems = Bundler.load.dependencies

    # Discover all model files in gem files and load them
    all_gems.each do |gem|
      if gem.groups.include? Rails.env.to_sym or gem.groups.include? :default
        puts "Gem name: \t#{gem.name}"
        spec = Gem::Specification.find_all_by_name gem.name
        discover spec.first.gem_dir
      end
    end

    # Discover models in current rails app and load them
    discover Rails.root

    if defined? ActiveRecord
      # Create a content type entry for all Models
      ActiveRecord::Base.subclasses.each do |model|
        create_model model.name, without_habtm
      end
    end

    if defined? Mongoid
      Mongoid.models.each do |model|
        create_model model.name, without_habtm
      end
    end
  end

  private

  def self.create_model(name, without_habtm)
    if name.to_s.starts_with?('HABTM_')
      ApplicationModels.find_or_create_by(model: name) if !without_habtm
    else
      ApplicationModels.find_or_create_by(model: name)
    end
  end

  def self.discover(path)
    Dir["#{path}/app/models/**/*.rb"].each do |model_file|
      puts "File matched: \t#{model_file}"
      begin
        require model_file
      rescue ActiveSupport::Concern::MultipleIncludedBlocks => e
        puts "[Ignored]: ActiveSupport::Concern::MultipleIncludedBlocks on #{model_file}"
      rescue ArgumentError => e
        if e.to_s.ends_with? 'another_enum'
          puts "[Ignored]: 'enum' redifination ignored."
        end
      end
    end
  end
end
