# frozen_string_literal: true

module Notebroker
  module Cells
    class Markdown
      extend Dry::Initializer

      param :lines

      def to_markdown
        return unless lines.any?

        if lines.last[-1] == "\n"
          lines.join
        else
          lines.join + "\n"
        end
      end
    end
  end
end
