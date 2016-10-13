require 'rails_helper'


feature "Static", :type => :feature do
  feature 'Home' do
    scenario 'header presents' do
      visit root_path
      expect(page).to have_selector 'h1'
    end
  end

  feature 'About' do
    scenario 'header presents' do
      visit about_path
      expect(page).to have_selector 'h1'
    end
  end

  feature 'Partners' do
    scenario 'header presents' do
      visit partners_path
      expect(page).to have_selector 'h1'
    end
  end

  feature 'FAQ' do
    scenario 'header presents' do
      visit faq_path
      expect(page).to have_selector 'h1'
    end
  end
end
