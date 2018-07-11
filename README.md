# Saringan &middot; [![Build Status](https://travis-ci.org/reinaldooli/saringan.svg?branch=master)](https://travis-ci.org/reinaldooli/saringan) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=square)](https://github.com/reinaldooli/saringan/blob/master/MIT-LICENSE)

Translate query strings to activerecord query parameters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'saringan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saringan

## Usage

Use Saringan::Translator to translate query string to activerecord parameters:

```ruby
irb> query = "name::John"
irb> Saringan::Translator.translate(query)
{ name: 'John' }
```

### Operators

**Obs.:** This is a preliminar version, so others operators will be implemented in future versions.

#### Equals

This handle absolute equals query like "WHERE name = 'John'".
To do it you must use Saringan equals operator '::'

In URL: http://site.com?query=name::John

In code:
```ruby
irb> query = params[:query]
irb> Saringan::Translator.translate(query)
{ name: 'John' }
```

### Parsers

**Obs.:** This is a preliminar version, so others parsers will be implemented in future versions.

#### String Parser

Just pass value without any qualifier

#### Date Time Parser

Pass value using Saringan Date Time qualifier.
Saringan will parse value to DateTime object. It expect date time in '%Y-%m-%d %H:%M:%S' format, see:

In URL: http://site.com?query=starts_at::dt[2018-06-30 00:00:00]

In code:
```ruby
irb> query = params[:query]
irb> Saringan::Translator.translate(query)
{ starts_at: DateTime object }
```

##### Range

Pass value using Saringan range operator '|'

In URL: http://site.com?query=starts_at::dt[2018-06-30 00:00:00|2018-06-30 23:59:59]

In code:
```ruby
irb> query = params[:query]
irb> Saringan::Translator.translate(query)
{ starts_at: DateTime object..DateTime object }
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
