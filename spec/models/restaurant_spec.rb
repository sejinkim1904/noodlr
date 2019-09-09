require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:latitude)}
    it {should validate_presence_of(:longitude)}
    it {should validate_presence_of(:rating)}
    it {should validate_presence_of(:address_1)}
    it {should validate_presence_of(:address_2)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
    it {should validate_presence_of(:yelp_id)}
    it {should validate_uniqueness_of(:yelp_id)}
  end
end
