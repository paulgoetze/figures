# figures [![[version]](https://badge.fury.io/rb/figures.svg)](http://badge.fury.io/rb/figures)  [![[travis]](https://travis-ci.org/paulgoetze/figures.png)](https://travis-ci.org/paulgoetze/figures)

German number words.

## Setup

Add to your `Gemfile`:

```ruby
gem 'figures'
```

## Usage

```ruby
require 'figures'

Figures.parse(1234, :de) # => 'eintausendzweihundertvierunddreißig'
```


## MIT License

Copyright (C) 2015 Paul Götze. Released under the MIT license.
