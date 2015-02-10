require 'tilt/ducktype/version'
require 'tilt'

module Tilt
  class DucktypeTemplate < Template
    def prepare
      #(data?)
      @tmpdir = "/tmp/"
      @tmpfile = "tilt-ducktype-file"
      @input = data
      @output = nil
    end

    def evaluate(scope, locals, &block)
      # Do some sort of evaluation stuff with shelling out
      #@output ||= "Foo000oooo #{scope.public_methods}, #{scope.instance_variables}, #{locals}, #{block}"
      File.write "#{@tmpdir}#{@tmpfile}", @input

      begin
        `ducktype #{@tmpdir}#{@tmpfile} -o #{@tmpdir}#{@tmpfile}.page`
        `cd #{@tmpdir} && yelp-build html #{@tmpdir}#{@tmpfile}.page`

        doc = Nokogiri::HTML(File.read "#{@tmpdir}#{@tmpfile}.html")

        @output ||= doc.css('body').to_s
      rescue
        @output = "Please install both ducktype and yelp-build."
      end
    end
  end

  register DucktypeTemplate, :ducktype, :dt, :mallard, :page
end
