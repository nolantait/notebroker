# frozen_string_literal: true

module Notebroker
  module Callable
    def call(args)
      new(args).call
    end
  end
end
