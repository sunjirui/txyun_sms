# Txyun::Sms

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/txyun/sms`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

######warn:  <font face="黑体" color=red>Only supported template send sms !</font>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'txyun-sms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install txyun-sms

# Usage

    $ rails g txyun:sms:initializer

## Configure

    Txyun::Sms.configure do |config|
      config.nationcode = ''
      config.sign = ''
      config.extend_code = ''
      config.ext = ''
      config.appkey = ''
      config.sdkappid = ''
    end

## Example

    Txyun::Sms.send('13133333333', tpl_id, '000000')

## Contributing

Bug reports and pull requests are welcome on GitHub at https://gitlab.com/sunjirui/txyun-sms.
