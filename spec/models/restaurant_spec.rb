require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'relationships' do
    it {should have_many(:dishes)}
  end
end
