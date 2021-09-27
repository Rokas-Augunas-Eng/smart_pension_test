# frozen_string_literal: true

require_relative 'log_parser'

def file_passed?(file)
  file.empty?
  puts 'Please pass a correct file path to parser.rb'
end

log_path = ARGV[0]
parser = LogParser.new(log_path)
file_passed?(log_path)

parser.parse
puts "\nMost unique views:"
puts "\n"
parser.display_unique_views
puts "\n ---------------------------"
puts "\nMost views: "
puts "\n"
parser.display_most_views
