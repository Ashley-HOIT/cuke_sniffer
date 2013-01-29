#!/usr/bin/env ruby
require 'cuke_sniffer'

help_cmd_txt = "Welcome to CukeSniffer!
Calling CukeSniffer with no arguments will run it against the current directory.
Other Options for Running include:
  <feature_file_path>, <step_def_file_path> : Runs CukeSniffer against the
                                              specified paths.
  -o, --out html (name)                     : Runs CukeSniffer then outputs an
                                              html file in the current
                                              directory (with optional name).
  -h, --help                                : You get this lovely document."


if ARGV.include? "-h" or ARGV.include? "--help"
  puts help_cmd_txt
  exit
end

cuke_sniffer = nil
if (ARGV[0] != nil and File.directory?(ARGV[0])) and (ARGV[1] != nil and File.directory?(ARGV[1]))
  cuke_sniffer = CukeSniffer::CLI.new(ARGV[0], ARGV[1])
else
  cuke_sniffer = CukeSniffer::CLI.new
end

def print_results(cuke_sniffer)
  puts cuke_sniffer.output_results
end

if ARGV.include? "--out" or ARGV.include? "-o"
  index = ARGV.index("--out")
  index ||= ARGV.index("-o")
  out_type = ARGV[index + 1]
  case out_type
    when "html"
      file_name = ARGV[index + 2]
      if file_name.nil?
        cuke_sniffer.output_html
      else
        file_name = file_name + ".html" unless file_name =~ /\.html$/
        cuke_sniffer.output_html(file_name)
      end
    else
      print_results(cuke_sniffer)
  end
else
  print_results(cuke_sniffer)
end

puts "Completed Sniffing."
