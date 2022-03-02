# frozen_string_literal: true

module Notebroker
  class Markdown
    extend Callable
    extend Dry::Initializer

    InvalidSource = Class.new(Error)

    param :source

    def call
      parsed = JSON.parse(source, symbolize_names: true)
      result = Lexer.call(parsed[:cells])
      result
        .filter_map(&:to_markdown)
        .join("\n")
    rescue JSON::ParserError
      raise InvalidSource
    end
  end
end
