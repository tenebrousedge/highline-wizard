require "highline/wizard/version"
require 'highline'

module Highline
  module Wizard
    class Wizzard
      attr_reader :selected
      def initialize(data)
        @options = Struct.new(:titles, :data).new
        @options.data = data
        @options.data.freeze
        @hl = HighLine.new
        yield @options if block_given?

        result = []
        current_data = data
        columns_count.times do |column_index|
          values = current_data.transpose[column_index].uniq
          choosen = nil
          if values.size > 1
            elected = choose(values, @options.titles[column_index])
          else
            elected = values.first
          end

          result << elected

          current_data = data.select{|row|
            row[column_index] == elected
          }

        end
        @selected = result
      end

      def choose(values, title)
        @hl.choose(*values) do  |menu|
          menu.prompt = "Please choose #{title}" if title
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

    def wizzard(data, &block)
      Wizzard.new(data,&block).selected
    end
  end
end
