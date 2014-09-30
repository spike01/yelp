require 'rails_helper'

describe 'Restaurants' do
  context 'No restaurants have been added' do
    it 'displays a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants found'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Front page updating from none to one' do
    before do
      Restaurant.create(name: 'Nobu')
      end
    it 'displays a restaurant when added' do
      visit '/restaurants'
      expect(page).to have_content 'Nobu'
      expect(page).not_to have_content 'No restaurants found'
    end
  end

  context 'Creating a new restaurant' do
    it 'has a form that can be filled out' do
      visit '/restaurants'
      click_link 'Add a restaurant' 
      fill_in 'Name', with: 'Galvin la Chappelle'
      fill_in 'Description', with: 'Bare banging food bruv. Would spit at again'
      click_button 'Submit restaurant'
      expect(page).to have_content 'Galvin la Chappelle'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'Updating a restaurant' do
    before do
      Restaurant.create(name: 'The FD',
                        description: 'What did I just eat?')
    end
    it 'can be updated' do
      visit '/restaurants'
      click_link 'Edit The FD'
      fill_in 'Name', with: 'The Fat Duck'
      click_button 'Submit restaurant'
      expect(page).to have_content 'The Fat Duck'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'Deleting a restaurant' do
    before do
      Restaurant.create(name: 'The Fat Duck',
                        description: 'What did I just eat?')
    end
    it 'can be deleted' do
    visit '/restaurants'
    click_link 'Delete The Fat Duck'
    expect(page).to have_content 'Restaurant deleted'
    end
  end

  context 'Showing a description' do
    before do
      Restaurant.create(name: 'The Fat Duck',
                        description: 'What did I just eat?')
    end
    it 'shows its description' do
      visit '/restaurants'
      click_link 'The Fat Duck'
      expect(page).to have_content 'What did I just eat?'
      expect(current_path).to match /restaurants\/\d/ 
      click_link 'Return to restaurants'
      expect(current_path).to eq '/restaurants'
    end
  end
end

