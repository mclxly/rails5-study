require 'test_helper'
require 'generators/vue_crud/vue_crud_generator'

class VueCrudGeneratorTest < Rails::Generators::TestCase
  tests VueCrudGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
