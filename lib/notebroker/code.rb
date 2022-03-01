# frozen_string_literal: true

module Notebroker
  class Code
    extend Dry::Initializer

    param :input_lines
    param :outputs

    def to_mdx
      return unless input_lines.any?

      [].tap do |lines|
        lines << "```python"
        lines << input_lines.join
        lines << "```\n"
        if output_lines.any?
          lines << [].tap do |output|
            output << "```shell\n"
            output << output_lines.join
            output << "```"
          end.join
        end
      end.join("\n")
    end

    private

    def output_lines
      outputs.map do |output|
        output[:text]
      end
    end
  end
end
