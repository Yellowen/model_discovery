# desc "Explaining what the task does"
# task :model_discovery do
#   # Task goes here
# end
namespace :model_discovery do
  desc "Re-Sync models"
  task :sync => :environment do
    require 'model_discovery'
    ModelDiscovery.build_table_list
  end
end
