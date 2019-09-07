require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :category }
    it { should validate_presence_of :image }
  end

  describe 'relationships' do
		it {should have_many :reviews}
		it {should belong_to :restaurant}
	end

  describe 'methods' do
    before :each do
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg")
      @ramen.reviews.create!(title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
      @ramen.reviews.create!(title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
    end

    it 'average rating' do
      expect(@ramen.average_rating).to eq(4)
    end
  end
end
