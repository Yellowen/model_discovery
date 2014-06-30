module ModelDiscovery

  # Create a list of current rails application tables or documents
  def self.build_table_list(without_habtm = true)
    # Get all gem by requiring them
    all_gems = Bundler.require()

    # Discover all model files in gem files and load them
    all_gems.each do |gem|
      if gem.groups.include? Rails.env.to_sym or gem.groups.include? :default
        puts "Gem name: #{gem.name}"
        spec = Gem::Specification.find_by_name gem.name
        discover spec.gem_dir
      end
    end

    # Discover models in current rails app and load them
    discover Rails.root

    if defined? ActiveRecord
      # Create a content type entry for all Models
      ActiveRecord::Base.subclasses.each do |model|
        #unless model.name.to_s.starts_with? 'HABTM_'
        if !model.name.to_s.starts_with?('HABTM_') &&  !without_habtm
          ApplicationModels.find_or_create_by(model: model.name)
        end
      end
    end

    if defined? Mongoid
      Mongoid.models.each do |model|
        if !model.name.to_s.starts_with?('HABTM_') &&  !without_habtm
          ApplicationModels.find_or_create_by(model: model.name)
        end
      end
    end
  end

  private

  def self.discover(path)
    Dir["#{path}/app/models/**/*.rb"].each do |model_file|
      puts "File matched: #{model_file}"
      load model_file
    end
  end
end
