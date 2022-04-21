require 'spec_helper'

RSpec.describe Team, type: :model do
  describe "validations" do
    it{ is_expected.to validate_presence :name }
  end
end