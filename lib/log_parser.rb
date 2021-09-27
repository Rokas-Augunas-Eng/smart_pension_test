# frozen_string_literal: true

# service to parse webserver.log
class LogParser
  attr_reader :visit_counts, :log_path

  def initialize(log_path)
    @log_path = log_path # "webserver.log"
    @visit_counts = Hash.new { |h, k| h[k] = [] } # {}
  end

  def parse
    File.foreach(log_path) do |line|
      address_and_ip = line.strip.split(' ')
      visit_counts[address_and_ip[0]] << address_and_ip[1]
    end
    visit_counts
  end

  def display_unique_views
    format_list(unique_views)
  end

  def display_most_views
    format_list(most_views)
  end

  def display_sorted_views
    format_list(sort_views)
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

  def sort_views
    sort_views = Hash.new { |h, k| h[k] = [] }
    visit_counts.each do |address, ips|
      sort_views[address] = ips.size
    end
    sort_views.sort_by { |address, _ip| address }
  end

  def format_list(list)
    list.each.with_index(1) do |(address, views), index|
      print "#{index}. #{address} - #{views} (views) \n"
    end
  end
end
