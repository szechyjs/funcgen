#!/usr/bin/env ruby

require 'socket'
require 'optparse'
require 'yaml'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: funcgen.rb [options]"

  opts.on("-F", "--func FUNC", [:sin, :squ, :ramp, :puls, :nois, :dc],
          "Function type",
          "  sin: sinusoid wave",
          "  squ: square wave",
          "  ramp: ramp wave",
          "  puls: pulse wave",
          "  nois: gaussian noise",
          "  dc: DC voltage") do |f|
    options[:func] = f
  end

  opts.on("--off", "Turn output off") do
    options[:output] = 'OFF'
  end

  opts.on("--on", "Turn output on") do
    options[:output] = 'ON'
  end

  opts.separator ""
  opts.separator "Function Parameters"

  opts.on("-f", "--freq Hz", Float, "Output frequency") do |f|
    options[:frequency] = f
  end

  opts.on("-v", "--volts V", Float, "Output voltage") do |v|
    options[:volts] = v
  end

  opts.on("-o", "--offset V", Float, "Output offset") do |v|
    options[:offset] = v
  end

  opts.separator ""
  opts.separator "Global Options"

  opts.on("-c", "--config FILE", "Config file") do |c|
    options[:config] = c
  end

  opts.on("-d", "--debug", "Verbose commands") do |v|
    options[:debug] = v
  end

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

end.parse!

if options[:config]
  config_file = options[:config]
else
  config_file = File.expand_path('~/.funcgen.yml')
end

if File.exist?(config_file)
  config = YAML.load_file(config_file)
else
  abort "Config file does not exist: #{config_file}"
end

cmds = []

if options[:func]
  func = options[:func].to_s.upcase
  freq = options[:frequency].nil? ? 'DEF' : options[:frequency].to_s

  if options[:func] == :dc
    if options[:offset]
      offset = options[:offset].to_s
    else
      offset = options[:volts].nil? ? 'DEF' : options[:volts].to_s
    end
    volts = 'DEF'
  else
    volts = options[:volts].nil? ? 'DEF' : options[:volts].to_s
    offset = options[:offset].nil? ? 'DEF' : options[:offset].to_s
  end

  cmds << "OUTput:LOAD INF"
  cmds << "APPLy:#{func} #{freq}, #{volts}, #{offset}"
end

if options[:output]
  cmds << "OUTput #{options[:output]}"
end

if cmds.empty?
  abort("Must specify a function or on/off argument")
else
  s = TCPSocket.open config['host'], config['port']

  cmds.each do |cmd|
    if options[:debug]
      puts cmd
    end
    s.write "#{cmd}\n"
  end
end
