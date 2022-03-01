# frozen_string_literal: true

module Notebroker
  class MDX
    extend Callable
    extend Dry::Initializer

    InvalidSource = Class.new(Error)

    param :source

    # @param String
    def call
      parsed = JSON.parse(source, symbolize_names: true)
      lexed = Lexer.call(parsed[:cells])
      lexed
        .filter_map(&:to_mdx)
        .join("\n")
    rescue JSON::ParserError
      raise InvalidSource
    end
  end
end
