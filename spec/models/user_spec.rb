require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:auth_type)}
    it {should validate_presence_of(:registered)}
    it {should validate_presence_of(:role)}
  end

	describe 'relationships' do
		it {should have_many :reviews}
    it {should have_many :emails}
    it {should have_many :facebooks}
    it {should have_many :googles}
	end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as a restaurant' do
      restaurant = User.create(role: "restaurant")

      expect(restaurant.role).to eq('restaurant')
      expect(restaurant.restaurant?).to be_truthy
    end

    it 'can be created as a photographer' do
      photographer = User.create(role: "photographer")

      expect(photographer.role).to eq('photographer')
      expect(photographer.photographer?).to be_truthy
    end

    it 'can be created as a critic' do
      critic = User.create(role: "critic")

      expect(critic.role).to eq('critic')
      expect(critic.critic?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(role: "admin")

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'methods' do
    before :each do
      @user = User.create(registered: 'true')
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
    end

    it 'reviewable?(item)' do
      expect(@user.reviewable?(@ramen)).to eq(true)
    end
  end
end
