require 'rails_helper'

describe 'Reviews' do
  before do
    Restaurant.create(name: 'The Fat Duck',
                      description: '3 Michelin Stars')
  end

  context 'Adding a review' do
    it 'can leave a review' do
      visit '/restaurants'
      click_link 'Review The Fat Duck'
      fill_in 'Your review', with: 'Expensive foodgasm'
      select '5', from: 'Rating' 
      click_button 'Leave review'
      expect(current_path).to eq '/restaurants'
      click_link 'The Fat Duck'
      expect(page).to have_content 'Expensive foodgasm'
      expect(page).to have_content 'Rating: 5'
      expect(current_path).to match /restaurants\/\d/ 
    end
  end
end
