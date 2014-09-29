require 'rails_helper'

describe 'Restaurants' do
  context 'No restaurant has been added' do
    it 'displays a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants found'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end

