# Redcarpet::Form::Extension

A [Redcarpet](https://github.com/vmg/redcarpet) extension with a custom HTML render to handle custom Markdown rules for tags like inputs and textareas.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redcarpet-form-extension'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install redcarpet-form-extension

## Usage

```ruby
# Initializes a Markdown parser with Redcarpet::Form::Extension::Render::HTML
markdown = Redcarpet::Markdown.new(Redcarpet::Form::Extension::Render::HTML)
```

### Input (inline)

Use the follwoing snap code to add an input tag in your html. By default, tag attributes are `type="text" name="[random_string]"` but you can use `{}` to pass the attributes you need:

```txt
Some text before [input]{ type="number" } and after.
```

Returns:

```html
<input type="number" name="gfkoyl" />
````

### Checkboxes

Also, you can create your fieldset of checkboxes:

```text
[]{ value="bike" } I have a bike [x]{ value="car" } I have a car [x]{ value="boat" } I have a boat
```

This snap returns the following HTML:

```html
<fieldset>
    <label><input type="checkbox" name="xekiry[]" value="bike" />I have a bike</label>
    <label><input type="checkbox" name="xekiry[]" value="car" checked />I have a car</label>
    <label><input type="checkbox" name="xekiry[]" value="boat" checked />I have a boat</label>
</fieldset>
```

**Note:** If `name` attribute is not passed, a temporary and random string will be generated. For empty
`value`s, a `opt_` string follwed by the element index will be placed.

### Radio Buttons

For a radio buttons group, you can type the following:

```txt
() HTML (x) CSS () JavaScript
```

which will return:

```html
<fieldset>
    <label><input type="radio" name="ybqkvo" value="radio_1" />HTML</label>
    <label><input type="radio" name="ybqkvo" value="radio_2" checked />CSS</label>
    <label><input type="radio" name="ybqkvo" value="radio_3" />JavaScript</label>
</fieldset>
```

**Note:** If `name` attribute is not passed, a temporary and random string will be generated. For empty
`value`s, a `radio_` string follwed by the element index will be placed.

### Textarea

Finally, a textarea can be generated using the follwing snap:

```txt
[textarea]{ value="Hello world!" rows="4" cols="10" } Text box
```

The HTML result is:

```html
<fieldset>
    <label>Text box</label>
    <textarea name="kaatyu" rows="4" cols="10">
        Hello world!
    </textarea>
</fieldset>
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SofiaSousa/redcarpet-form-extension. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/SofiaSousa/redcarpet-form-extension/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Redcarpet::Form::Extension project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SofiaSousa/redcarpet-form-extension/blob/master/CODE_OF_CONDUCT.md).
