# frozen_string_literal: true

module Notebroker
  class Lexer
    extend Callable
    extend Dry::Initializer

    param :lines

    def call
      lines.map do |cell|
        case type = cell[:cell_type]
          when "markdown" then Cells::Markdown.new(cell[:source])
          when "code" then Cells::Code.new(
            cell.fetch(:source, []),
            cell.fetch(:outputs, [])
          )
          else
            fail UnknownCellType, "No handler for #{type}"
        end
      end
    end
  end
end
