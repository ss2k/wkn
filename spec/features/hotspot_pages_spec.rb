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
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).to have_css 'li', :text => 'abcd'
  end

  scenario 'Create Hotspot without accepting terms of service' do
    complete_hotspot_form
    page.uncheck 'Accept Hotspot Terms and Conditions'
    click_button 'Create Hotspot'
    expect(page).not_to have_css 'li', :text => 'abcd'
  end

  scenario 'Access only hotspots owned by the user' do
    mine = create(:hotspot, :user => user)
    not_mine = create(:hotspot)
    visit root_path
    expect(page).to have_css 'li', :text => mine.name
    expect(page).not_to have_css 'li', :text => not_mine.name
  end

  def complete_hotspot_form
    click_link 'Create a Hotspot'
    fill_in 'Hotspot Name', :with => 'abcd'
    page.select 'Food & Dining', :from => 'Business Category'
    fill_in 'Address 1', :with => '26 Broadway'
    fill_in 'City', :with => 'New York City'
    fill_in 'State', :with => 'NY'
    fill_in 'Zip', :with => '10004'
    fill_in 'Country', :with => 'USA'
    page.check 'Accept Hotspot Terms and Conditions'
  end
end

