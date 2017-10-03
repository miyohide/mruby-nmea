# mruby-nmea   [![Build Status](https://travis-ci.org/miyohide/mruby-nmea.svg?branch=master)](https://travis-ci.org/miyohide/mruby-nmea)
Nmea class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'miyohide/mruby-nmea'
end
```
## example
```ruby
p Nmea.hi
#=> "hi!!"
t = Nmea.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
