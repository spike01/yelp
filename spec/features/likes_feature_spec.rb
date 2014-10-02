require 'rails_helper'

describe 'Liking reviews' do
  before do
    restaurant = Restaurant.create(name: 'Nobu')
    restaurant.reviews.create(rating: 3, review: 'Still reppin fo dem fishies all across the world')
  end

  xit 'users can like reviews, with an ascending like count' do
    visit '/restaurants'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
