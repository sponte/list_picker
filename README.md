# ListPicker

Library for prompting users for input

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'list_picker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install list_picker

## Usage

```ruby
require 'list_picker'

array = %w{ Option1 Option2 Option3 }
chosen_option = ListPicker::Picker.new(array).ask("Please select from list of available options")
```

### Using objects

You can use objects and define method that will be used to be displayed in the list. In order to do that, you can pass in options to the constructor:

```ruby
require 'list_picker'

array = (1..10).map do |i|
	Time.new(Time.now.year + i)
end

chosen_option = ListPicker::Picker.new(array, label_method: :year).ask("Please select a year from the list")
```

### Batch mode

ListPicker reads arguments passed into the script so that you can predefine your ansers. For instance:

Take for example file *test.rb* with contents:
```ruby
require 'list_picker'

array = (1..10).map do |i|
	Time.new(Time.now.year + i)
end

chosen_option = ListPicker::Picker.new(array, label_method: :year).ask("Please select a year from the list")
```
You can then invoke it by calling:

```ruby
ruby test.rb 4
```

This will have preselected 4th option from the list

## Contributing

1. Fork it ( https://github.com/sponte/list_picker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
