# frozen_string_literal: true
require "rails_helper"

RSpec.describe(NetworkHelper) do
  let(:dummy_class) { Class.new { include NetworkHelper } }

  it "allows #do_request" do
    dummy_instance = dummy_class.new
    allow(dummy_instance).to(receive(:do_request))
  end
end
