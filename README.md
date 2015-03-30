# Readable Interface

https://gist.github.com/hyoshida/fb62eaf7fbcd7befda2f

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'readable_interface'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install readable_interface

## Usage

```ruby
class Car
  extend ReadableInterface

  readable_interface :engine, message: 'Please call `engine` method with any engine class.'

  def start
    "#{engine.class.name} is started!"
  end
end

class AwesomeEngine
end

class AwesomeCar < Car
  engine AwesomeEngine.new
end

awesome_car = AwesomeCar.new
awesome_car.start
#=> "AwesomeEngine is started!"

class AwfulCar < Car
end

awful_car = AwfulCar.new
awful_car.start
#=> NotImplementedError: Please call `engine` method with any engine class.
```

## Contributing

1. Fork it ( https://github.com/hyoshida/readable_interface/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
