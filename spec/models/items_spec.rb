require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :category }
    it { should validate_presence_of :image }
  end
end
