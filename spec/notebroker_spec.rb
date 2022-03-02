# frozen_string_literal: true

RSpec.describe Notebroker do
  it "has a version number" do
    expect(Notebroker::VERSION).not_to be_nil
  end

  it "converts a file to markdown" do
    expect(
      described_class.to_markdown(File.read("spec/fixtures/notebook.ipynb"))
    ).to be_a String
  end
end
