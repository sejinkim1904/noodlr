require 'rails_helper'

describe Item, search: true do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :category }
    it { should validate_presence_of :status }
    it { should validate_presence_of :image }
  end

  describe 'relationships' do
		it {should have_many :reviews}
		it {should belong_to :restaurant}
	end

  describe 'methods' do
    before :each do
      @user = User.create!(registered: 'true')
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
      @ramen.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
    end

    it 'average rating' do
      expect(@ramen.average_rating).to eq(4)
    end

    it "search" do
      Item.search_index.refresh
      assert_equal ["Tonkotsu"], Item.search("tonkotsu").map(&:name)
    end
  end
end
