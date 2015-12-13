# Slatan

Ruby gem to create bot for Slack easily and flexibly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slatan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slatan

## Usage

#### 1. Add 'Bot' integration and cory API token on Slack.

#### 2. Generate event subscriber class.

```
$ rake slatan:generate['/path/to/your/preference/test.rb']
```

#### 3. Write code to running slatan.

```ruby
require 'slatan'
require 'path/to/your/preference/test.rb'

Slatan::Spirit.slack_token = 'xxxx-xxxxxx-xxxxxxxxxx'   #or `export SLACK_TOKEN=xxxxx-xxxx-xxxxxxxxxx`

Slatan::Ear.register(Test.new)   #register event subscriber

Slatan.run   #write 'Slatan.run({ daemonize: true })' if you run daemonize mode.
```

#### 4. type 'ping' on Slack

![slatan example](https://dl.dropboxusercontent.com/u/74925506/slatan_invitation.png)

##Documentation
Under construction...

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kudohamu/slatan.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

