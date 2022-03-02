# frozen_string_literal: true

module Notebroker
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts Notebroker::VERSION
        end
      end

      class Convert < Dry::CLI::Command
        desc "Converts a ipynb file into the requested format"

        argument :source, required: true, desc: "The source filepath"
        argument :destination, desc: "The output filepath"

        def call(source:, destination: "./")
          puts File.write(
            destination + "converted.mdx",
            Notebroker::MDX.call(File.read(source))
          )
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "convert", Convert, aliases: ["c", "-c", "--convert"]
    end
  end
end
