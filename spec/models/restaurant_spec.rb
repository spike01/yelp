require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it 'is not valid with a name fewer than 3 chars' do
    restaurant = Restaurant.new(name: 'Th')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid 
  end
end
