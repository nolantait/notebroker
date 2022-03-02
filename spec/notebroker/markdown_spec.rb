# frozen_string_literal: true

require "spec_helper"

RSpec.describe Notebroker::Markdown do
  it "returns the expected markdown file" do
    source = File.read("spec/fixtures/notebook.ipynb")
    expected_result = File.read("spec/fixtures/converted.md")
    result = described_class.call(source)
    expect(result).to eql expected_result
  end
end
