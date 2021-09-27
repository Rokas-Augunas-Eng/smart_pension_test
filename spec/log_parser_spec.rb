# frozen_string_literal: true

require 'log_parser'

RSpec.describe LogParser do
  let(:log_parser) { described_class.new('webserver.log') }
  # subject { described_class.new('webserver.log') }

  describe '.LogParser' do
    it 'has a type' do
      expect(log_parser.log_path).to eq('webserver.log')
    end

    it 'confirms that an object can respond to a method' do
      expect(log_parser).to respond_to(:parse, :display_unique_views, :display_most_views)
    end # object cabn respond to a given method
  end

  describe '#initialize method' do
    it 'should take one argument' do
      expect(LogParser.instance_method(:initialize).arity).to eq(1)
    end
  end

  describe '#parse method' do
    it 'should return an hash' do
      expect(log_parser.parse).to be_a(Hash)
    end

    it 'should inlcude urls in the hash' do
      expect(log_parser.parse).to include('/about/2', '/contact', '/index', '/about', '/help_page/1', '/home')
    end # include matcher. Checks if it includes
  end

  describe '#diplay_unique_views method' do
    it 'should not equal to zero' do
      expect(log_parser.display_unique_views).not_to eq(0)
    end
  end

  describe '#diplay_most_views method' do
    it 'should not equal to zero' do
      expect(log_parser.display_most_views).not_to eq(0)
    end
  end
end
