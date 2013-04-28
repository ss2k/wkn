require 'spec_helper'

feature 'Hotspot pages' do
  given(:user) { create(:user) }

  background do
    sign_in_as user
  end

  scenario 'Display page title of "Hotspots" when in dashboard' do
    expect(page).to have_css '[data-role="page-title"]', :text => 'Hotspots'
  end

  scenario 'Display welcome message when in new page' do
    click_link 'Create a Hotspot'
    expect(page).to have_css '[data-role="page-title"]', :text => 'Welcome to the WiFi-K9 Network!'
  end

  scenario 'Create Hotspots' do
    complete_hotspot_form_with 'abcd'
    click_button 'Create Hotspot'
    expect(page).to have_css '[data-role="page-title"]', :text => 'abcd'
  end

  scenario 'Create Hotspot without accepting terms of service' do
    complete_hotspot_form_with 'abcd'
    page.uncheck 'Accept Hotspot Terms and Conditions'
    click_button 'Create Hotspot'
    expect(page).not_to have_css 'li', :text => 'abcd'
  end

  scenario 'Access only hotspots owned by the user' do
    mine = user.hotspots.create(:name => 'abcd', :category => 'Education')
    not_mine = create(:hotspot)
    visit root_path
    expect(page).to have_css 'li', :text => mine.name
    expect(page).not_to have_css 'li', :text => not_mine.name
  end

  scenario 'Go to Hotspot page from dashboard' do
    hotspot = user.hotspots.create(:name => 'abcd', :category => 'Education')
    visit root_path
    click_link 'abcd'
    expect(page).to have_css '[data-role="page-title"]', :text => 'abcd'
  end
end

