require "highline/wizard/version"

module Highline
  module Wizard
    class Wizzard
      def initialize(data)
        options = Struct.new(:titles).new
        yield options if &blockgiven
        @selected = (0..(data.size)).to_a
        columns = data.map(&:size).max


        while @selected.size > 1 || questions_left < 1


        end

      end
    end

    def wizzard(data, &block)
      Wizzard.new(data,&block).selected
    end
  end
end
