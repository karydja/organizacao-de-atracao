require 'rails_helper'

RSpec.describe Attraction, type: :model do
  context "required attributes validation" do
    it "must require presence of name" do
      expect(build(:attraction, name: nil)).to be_invalid
    end
  end
end