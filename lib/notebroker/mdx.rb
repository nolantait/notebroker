# frozen_string_literal: true

module Notebroker
  class MDX
    InvalidSource = Class.new(Error)

    # @param String
    def call(source)
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
