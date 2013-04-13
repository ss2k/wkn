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

  scenario 'Access only hotspots owned by the user' do
    mine = create(:hotspot, :user => user)
    not_mine = create(:hotspot)
    visit hotspots_path
    expect(page).to have_css 'li', :text => mine.name
    expect(page).not_to have_css 'li', :text => not_mine.name
  end
end

