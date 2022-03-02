# frozen_string_literal: true

module Notebroker
  module Cells
    class Code
      extend Dry::Initializer

      param :input_lines
      param :outputs

      def to_markdown
        return unless input_lines.any?

        source = [].tap do |lines|
          lines << wrap_code(input_lines, "python")
          lines << wrap_code(output_lines, "shell") if output_lines.any?
        end

        source.flatten.join("\n")
      end

      private

      def wrap_code(code, language)
        [].tap do |lines|
          lines << "```#{language}"
          lines << normalize(code).join("\n")
          lines << "```\n"
        end
      end

      def normalize(code)
        code.flatten.map do |line|
          line.delete("\n")
        end
      end

      def output_lines
        outputs.reduce([]) do |lines, output|
          lines << output[:text]
        end
      end
    end
  end
end
