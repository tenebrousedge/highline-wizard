# Highline::Wizard

Highline Wizard is a library to help you getting options. That options should be passed as a 2 dimension array.


## Installation

Add this line to your application's Gemfile:

    gem 'highline-wizard'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install highline-wizard

## Usage

In your ruby script

```ruby
require 'highline/wizard'

OPTIONS = [
  %W( icecream chocolate extra-topping 4.5 )
  %W( icecream chocolate no-topping 3.5 )
  %W( cake chocolate no-topping 4.5 )
  %W( cake vanilla no-topping 4.5 )
]

selected = wizzard(OPTIONS) do
  titles << %w(desert flavor extra price)
end

puts selected.inspect

```

This will generate to the user the following conversation:

```shell
1. icecream
2. cake
Choose desert? 2

1. chocolate
2. vanilla
Choose flavor? 1

{ "desert" => "cake", "flavor" => "chocolate", "extra" => "no-toppinng", "price" => "4.5" }
```

Other option:

```shell
1. icecream
2. cake
Choose desert? 1

1. extra-topping
2. no-topping
Choose extra? 2

{ "desert" => "icecream", "flavor" => "chocolate", "extra" => "no-topping", "price" => "4.5" }

```

As you can see, options that are not possible are not asked.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
