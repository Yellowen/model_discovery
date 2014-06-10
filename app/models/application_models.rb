# This model contains all the model names in a rails
# application
class ApplicationModels < (defined?(ActiveRecord) ? ActiveRecord::Base : Object)

  if defined? Mongoid
    include Mongoid::Document
    include Mongoid::Timestamps

    field :model, :type => String
  end

end
