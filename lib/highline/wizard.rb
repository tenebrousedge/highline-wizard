require "highline/wizard/version"
require 'highline'

module Highline
  module Wizard
    class Wizzard
      attr_reader :selected
      def initialize(data = nil)
        @options = Struct.new(:titles, :defaults, :data).new
        @options.defaults = []
        @options.titles = []
        @options.data ||= data
        @options.data.freeze
        @hl = HighLine.new
        yield @options if block_given?

        result = []
        current_data = data.dup
        columns_count.times do |column_index|
          values = current_data.transpose[column_index].uniq
          choosen = nil
          if values.size > 1
            elected = choose(values, @options.titles[column_index], @options.defaults[column_index])
          else
            elected = values.first
          end

          result << elected

          current_data = current_data.select{|row|
            row[column_index] == elected
          }

        end
        @selected = result
      end

      def choose(values, title, default = nil)
        @hl.choose(*(values.sort)) do  |menu|
          default = nil unless values.include?(default)
          prompt = "Please choose"
          prompt << " #{title}" if title
          prompt << " ( Default: #{default} )" if default
          menu.prompt = prompt
          menu.default = default if default
        end
      end

      protected
      def data
        @options.data
      end

      def columns_count
        columns.size
      end

      def columns
        data.transpose
      end
    end

    def wizzard(data = nil, &block)
      Wizzard.new(data,&block).selected
    end
  end
end
