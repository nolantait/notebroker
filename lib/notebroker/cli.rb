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
        option :destination,
               type: :string,
               default: "./",
               desc: "The output filepath"

        def call(source:, destination: "./")
          File.write(
            destination + "converted.md",
            Notebroker.to_markdown(File.read(source))
          )
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "convert", Convert, aliases: ["c", "-c", "--convert"]
      before("convert") do |args|
        puts "Converting #{args.fetch(:source)} into markdown..."
      end
      after("convert") do |args|
        puts "Saved markdown file to #{args.fetch(:destination, "./")}"
      end
    end
  end
end
