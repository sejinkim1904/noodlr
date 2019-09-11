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
      @ramen_1 = @restaurant.items.create!(name: "Tonkotsu", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen_2 = @restaurant.items.create!(name: "Shoyu", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen_3 = @restaurant.items.create!(name: "Miso", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen_4 = @restaurant.items.create!(name: "Tsukemen", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen_5 = @restaurant.items.create!(name: "Shio", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen_1.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
      @ramen_1.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
      @ramen_2.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 2)
      @ramen_3.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
      @ramen_4.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 1)
      @ramen_5.reviews.create!(user: @user, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
    end

    it 'average rating' do
      expect(@ramen_1.average_rating).to eq(4)
    end

    it "by_avg_rating" do
      expect(Item.by_avg_rating).to eq([@ramen_5, @ramen_1, @ramen_3, @ramen_2, @ramen_4])
    end

    it "search" do
      Item.search_index.refresh
      assert_equal ["Tonkotsu"], Item.search("tonkotsu").map(&:name)
    end
  end
end
