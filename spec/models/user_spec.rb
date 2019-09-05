require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:registered)}
    it {should validate_presence_of(:role)}
    it {should validate_presence_of(:password_digest)}
  end

	describe 'relationships' do
		# it {should have_many :user_credentials}
		# it {should have_many :user_videos}
		# it {should have_many(:videos).through(:user_videos)}
		# it {should have_many :friendships}
		# it {should have_many(:friends).through(:friendships)}
	end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', last_name:'Bo', role: "default")

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as a restaurant' do
      restaurant = User.create(email: 'restaurant@email.com', password: 'restaurant', first_name:'Bob', last_name:'Ross', role: "restaurant")

      expect(restaurant.role).to eq('restaurant')
      expect(restaurant.restaurant?).to be_truthy
    end

    it 'can be created as a photographer' do
      photographer = User.create(email: 'photographer@email.com', password: 'photographer', first_name:'Bob', last_name:'Ross', role: "photographer")

      expect(photographer.role).to eq('photographer')
      expect(photographer.photographer?).to be_truthy
    end

    it 'can be created as a critic' do
      critic = User.create(email: 'critic@email.com', password: 'critic', first_name:'Bob', last_name:'Ross', role: "critic")

      expect(critic.role).to eq('critic')
      expect(critic.critic?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', last_name:'Ross', role: "admin")

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'methods' do

  end
end
