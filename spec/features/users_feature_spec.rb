require 'rails_helper'

describe 'User accounts' do
  context 'signing up' do
    it 'has a signing up feature' do
      visit '/restaurants'
      click_link 'Sign up'
      expect(page).to have_content "Log in"
    end
  end

  context 'Twitter sign in' do
    it 'can sign in with Twitter' do
      visit '/'
      click_link 'Sign in'
      expect(page).to have_content "Twitter"
    end
  end
end

