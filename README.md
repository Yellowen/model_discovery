# ModelDiscovery [![Gem Version](https://badge.fury.io/rb/model_discovery.png)](http://badge.fury.io/rb/model_discovery)

ModelDiscovery is a simple yet flexible and fast solution to model discovery problem in Ruby on Rails applications. Detecting applications model in a Rails application is a bit hard because of [autoload](http://api.rubyonrails.org/classes/ActiveSupport/Autoload.html) convention, specially when you use set of gems which add their own models to your application.

ModelDiscovery provides a solution to this problem without loading models in runtime. If you're familiar with [Django](https://www.djangoproject.com) framework, you can think ok ModelDiscovery as something like **ContentType** application in Django.

## Installation
Add this line to your application's Gemfile:

    gem 'model_discovery'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install model_discovery

Then add this line to your `db/seeds.rb` file:
```ruby
ModelDiscovery::Engine.load_seed
```
## Usage

ModelDiscovery will add a model to your application which will contains all the models class name. So you can use active record's query to fetch model names like:
```ruby
# Fetch all models class names
models = ApplicationModels.all
# => ["User", "Group", "SomeGem::ModelExample"]

# Access to actual class of a model
model_class = models[0].constantize
# => "User"

# It's like User.all
model_class.all
```
It's simple isn't it ?
## Bugs
If you find any bug or have any issue using this gem I'll be happy to know. Please file an issue in [Issue Tracker](https://github.com/Yellowen/model_discovery/issues)
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit
![Yellowen](http://www.yellowen.com/images/logo.png)

**Model Discovery**  is maintained and funded by Yellowen. Whenever a code snippet is borrowed or inspired by existing code, we try to credit the original developer/designer in our source code. Let us know if you think we have missed to do this.


# License

**Model Discovery** is Copyright © 2013-2015 Yellowen. It is free software, and may be redistributed under the terms specified in the LICENSE file.
