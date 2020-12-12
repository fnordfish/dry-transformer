# frozen_string_literal: true

RSpec.describe Dry::Transformer::FunctionNotFoundError do
  it "complains that the function not registered" do
    Foo = Module.new { extend Dry::Transformer::Registry }

    expect { Foo[:foo] }.to raise_error do |error|
      expect(error).to be_kind_of described_class
      expect(error.message["function Foo[:foo]"]).not_to be_nil
    end
  end
end
