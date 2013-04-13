require 'spec_helper'

feature 'Hotspot pages' do
  given(:user) { create(:user) }

  background do
    sign_in_as user
    click_link 'Create a Hotspot'
  end

  scenario 'Create Hotspots' do
    fill_in 'Hotspot Name', :with => 'abcd'
    page.select 'Food & Dining', :from => 'Business Category'
    page.check 'Accept Hotspot Terms and Conditions'
    click_button 'Create Hotspot'
    expect(page).to have_css 'li', :text => 'abcd'
  end

  scenario 'Create Hotspot without accepting terms of service' do
    fill_in 'Hotspot Name', :with => 'abcd'
    page.select 'Food & Dining', :from => 'Business Category'
    page.uncheck 'Accept Hotspot Terms and Conditions'
    click_button 'Create Hotspot'
    expect(page).not_to have_css 'li', :text => 'abcd'
  end
end

