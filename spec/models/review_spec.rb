require 'rails_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :item_id }
  end

  describe 'relationships' do
		it {should belong_to :item}
		it {should belong_to :user}
	end
end
