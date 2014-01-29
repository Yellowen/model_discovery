require 'test_helper'

class ModelDiscoveryTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ModelDiscovery
  end
end
