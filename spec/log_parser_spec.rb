# frozen_string_literal: true

require 'log_parser'

describe LogParser do
  log_parser = LogParser.new('webserver.log')

  describe '#initialize' do
    it 'should take one parameter' do
      expect(LogParser.instance_method(:initialize).arity).to eq(1)
    end
  end

  describe '#parse' do
    it 'should return an array' do
      expect(log_parser.parse).to be_an_instance_of(Array)
    end
  end

  describe '#diplay_unique_views' do
    it 'number of unique visits should not equal to zero' do
      expect(log_parser.display_unique_views).not_to eq(0)
    end

    it 'Top three addresses by unique views are /help_page/1, /contact and /home' do
      expect(log_parser.display_unique_views.first(3)).to eq([['/help_page/1', 23], ['/contact', 23], ['/home', 23]])
    end
  end

  describe '#diplay_most_views' do
    it 'number of most visits should not equal to zero' do
      expect(log_parser.display_most_views).not_to eq(0)
    end

    it 'Top three addresses by top views are /help_page/1, /contact and /home' do
      expect(log_parser.display_most_views.first(3)).to eq([['/about/2', 90], ['/contact', 89], ['/index', 82]])
    end
  end
end
