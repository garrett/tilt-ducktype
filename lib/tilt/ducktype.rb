require 'tilt/ducktype/version'
require 'tilt'

module Tilt
  class DucktypeTemplate < Template
    def prepare
      #(data?)
      @output = nil
    end

    def evaluate(scope, locals, &block)
      # Do some sort of evaluation stuff with shelling out
      @output ||= "FOO! #{scope}, #{locals}, #{block}"
    end
  end

  register DucktypeTemplate, :ducktype, :dt, :mallard, :page
end
