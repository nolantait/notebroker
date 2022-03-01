# frozen_string_literal: true

require "spec_helper"

RSpec.describe Notebroker::MDX do
  it "returns the expected mdx file" do
    source = File.read("spec/fixtures/notebook.ipynb")
    expected_result = File.read("spec/fixtures/converted.mdx")
    result = described_class.call(source)
    expect(result.split("\n")).to eq expected_result.split("\n")
  end
end
