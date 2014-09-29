require 'rails_helper'

describe 'Restaurants' do
  context 'No restaurants have been added' do
    it 'displays a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants found'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Added a restaurant' do
    before do
      Restaurant.create(name: 'Nobu')
      end
    it 'displays a restaurant when added' do
      visit '/restaurants'
      expect(page).to have_content 'Nobu'
      expect(page).not_to have_content 'No restaurants found'
    end
  end
end

