# frozen_string_literal: true

require "json"
require "dry-initializer"
require "dry/cli"

require_relative "notebroker/version"
require_relative "notebroker/callable"
require_relative "notebroker/error"
require_relative "notebroker/cells/code"
require_relative "notebroker/cells/markdown"
require_relative "notebroker/lexer"
require_relative "notebroker/markdown"
require_relative "notebroker/cli"

module Notebroker
  def self.to_markdown(source)
    Markdown.call(source)
  end
end
