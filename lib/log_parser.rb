# frozen_string_literal: true

# service to parse webserver.log
class LogParser
  attr_reader :visit_counts, :log_path

  def initialize(log_path)
    @log_path = log_path
    @visit_counts = Hash.new { |h, k| h[k] = [] }
  end

  def parse
    lines = File.readlines(log_path)

    lines.each do |line|
      address_and_ip = line.strip.split(' ')
      visit_counts[address_and_ip[0]] << address_and_ip[1]
    end
  end

  def display_unique_views
    format_list(unique_views)
  end

  def display_most_views
    format_list(most_views)
  end

  private

  def unique_views
    unique_views = Hash.new { |h, k| h[k] = [] }
    visit_counts.each do |address, ips|
      unique_views[address] = ips.uniq.size
    end
    unique_views.sort_by { |_address, ip| -ip }
  end

  def most_views
    top_views = Hash.new { |h, k| h[k] = [] }
    visit_counts.each do |address, ips|
      top_views[address] = ips.size
    end
    top_views.sort_by { |_address, ip| -ip }
  end

  def format_list(list)
    list.each_with_index do |(address, views), index|
      print "#{index + 1}. #{address} - #{views} (views) \n"
    end
  end
end
