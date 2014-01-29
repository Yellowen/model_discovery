module ModelDiscovery
  def self.build_table_list
    # Get all gem by requiring them
    all_gems = Bundler.require

    # Discover all model files in gem files and load them
    all_gems.each do |gem|
      puts "Gem name: #{gem.name}"
      spec = Gem::Specification.find_by_name gem.name
      discover spec.gem_dir
    end

    # Discover models in current rails app and load them
    discover Rails.root

    # Create a content type entry for all Models
    ActiveRecord::Base.subclasses.each do |model|
      ApplicationModels.create(:model => model.to_s)
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