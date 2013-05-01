# Profane

Profane is a basic profanity filter designed to filter and detect keywords based
on an internal or external dictionary, or a combination of both.

## Installation

Add this line to your application's Gemfile:

    gem 'profane'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install profane

## Configuration

You can include words from your own dictionary in a hash or a yaml file, where
the key is the target word and the value is an obfuscated replacement you would
like to use.

Adding words to the dictionary with a hash:
```
Profane.configure(dictionary: { obscenity: 'obs******', vulgarity: 'vul******' })
```

Adding words to the dictionary with a yml file:
```
Profane.configure(dictionary_file: 'config/dictionary.yml')
```

You can override the entire dictionary with your own by setting
use_internal_dictionary to false.
```
Profane.configure(dictionary: { obscenity: 'obs******' }, use_internal_dictionary: false)
Profane.configure(dictionary_file: 'config/dictionary.yml', use_internal_dictionary: false)
```

If you set a key to '' in the dictionary profane will use the default strategy
of overwriting the entire word (exempting punctuation) with '*'. You can pass an
alternative character to use with the filter_character option.
```
Profane.configure(filter_character: '&')
```
Note that if you want to actually replace words with blank string you can use ''
as your default character.

## Usage

Filter profanity from a bit of text:
```
Profane::Filter.filter('Voldemort!')
=> '*********!')
```

Detect profanity in a bit of text:
```
Profane::Filter.profane?('If you come to a fork in the road, take it.')
=> 'false'
```

## Thanks

Special thanks to Joseph Hsu (https://github.com/jhsu) and James Tucker (https://github.com/raggi) for their contributions to this gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
