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
end
