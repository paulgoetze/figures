# figures [![[version]](https://badge.fury.io/rb/figures.svg)](https://badge.fury.io/rb/figures)  [![[ci]](https://github.com/paulgoetze/figures/workflows/Test/badge.svg)](https://github.com/paulgoetze/figures/actions?query=workflow%3ATest)

German number words.

## Setup

Add to your `Gemfile`:

```ruby
gem 'figures'
```

## Usage

```ruby
require 'figures'

>> Figures.parse(1234, :de)
=> 'eintausendzweihundertvierunddreißig'
>> Figures.parse(11948643178718557106276991626757751015195481434, :de)
=> "elf Septilliarden neunhundertachtundvierzig Septillionen sechshundertdreiundvierzig Sextilliarden einhundertachtundsiebzig Sextillionen siebenhundertachtzehn Quintilliarden fünfhundertsiebenundfünfzig Quintillionen einhundertsechs Quadrilliarden zweihundertsechsundsiebzig Quadrillionen neunhunderteinundneunzig Trilliarden sechshundertsechsundzwanzig Trillionen siebenhundertsiebenundfünfzig Billiarden siebenhunderteinundfünfzig Billionen fünfzehn Milliarden einhundertfünfundneunzig Millionen vierhunderteinundachtzigtausendvierhundertvierunddreißig"
```


## MIT License

Copyright (C) 2015 Paul Götze, Jan Lelis. Released under the MIT license.
