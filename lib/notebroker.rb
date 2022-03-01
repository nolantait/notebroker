# frozen_string_literal: true

require "json"
require "dry-initializer"

require_relative "notebroker/version"
require_relative "notebroker/callable"
require_relative "notebroker/error"
require_relative "notebroker/code"
require_relative "notebroker/markdown"
require_relative "notebroker/lexer"
require_relative "notebroker/mdx"

module Notebroker
  def self.to_mdx(source)
    MDX.call(source)
  end
end
