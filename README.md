[![Gem](https://img.shields.io/gem/v/funcgen.svg)](https://rubygems.org/gems/funcgen)

# Funcgen

## Installation

    $ gem install funcgen

## Config

A configuration file is required to define the connection settings. By default this file is read from `$HOME/.funcgen.yml`, its location can also be specified using the `--config` option.

```yml
host: 192.168.1.123
port: 5025
```

## Usage

```
Usage: funcgen [options]
    -F, --func FUNC                  Function type
                                       sin: sinusoid wave
                                       squ: square wave
                                       ramp: ramp wave
                                       puls: pulse wave
                                       nois: gaussian noise
                                       dc: DC voltage
        --off                        Turn output off
        --on                         Turn output on

Function Parameters
    -f, --freq Hz                    Output frequency
    -v, --volts V                    Output voltage
    -o, --offset V                   Output offset

Global Options
    -c, --config FILE                Config file
    -d, --debug                      Verbose commands
    -h, --help                       Show this message
```

### Examples

Turn output on

    funcgen --on

Set 25kHz, 0-5V sinusoid wave

    funcgen -F sin -v 5 -o 2.5 -f 25000

Set 3.3VDC and turn on output (the offset or volts option can be used for DC)

    funcgen -F dc -v 3.3 --on
    funcgen -F dc -o 3.3 --on

Change the frequency of current square wave

    funcgen -F squ -f 50000


## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/szechyjs/funcgen.

