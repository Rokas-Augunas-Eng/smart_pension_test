# frozen_string_literal: true

require_relative 'log_parser'

if ARGV.empty?
  puts 'Please pass a file path to parser.rb'
else
  log_path = ARGV[0]

  parser = LogParser.new(log_path)

  parser.parse
  puts "\nMost unique views:"
  puts "\n"
  parser.display_unique_views
  puts "\n ---------------------------"
  puts "\nMost views: "
  puts "\n"
  parser.display_most_views
end
