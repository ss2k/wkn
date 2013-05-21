require 'spec_helper'

feature 'Hotspot pages' do given(:user) { create(:user) }
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

  scenario 'Publish the first landing page by default' do
    hotspot = user.hotspots.create(:name => 'efgh', :category => 'Education')
    landing = hotspot.landings.create(:title => 'foo', :markup => '<ul><li>abcd</li><li>efgh</li></ul>')
    landing.save!
    visit "/#{hotspot.name}"
    expect(page).to have_css 'ul li', :text => 'abcd'
    expect(page).to have_css 'ul li', :text => 'efgh'
  end

  scenario 'Hotspot creator is automatically an editor' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).to have_css '.editor', :text => user.email
  end

  scenario 'Hotspot creator is admin by default' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).to have_css '.admin', :text => user.email
  end

  scenario 'A non editor is not listed in the list of editors' do
    not_an_editor = create(:user)
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).not_to have_css '.editor', :text => not_an_editor.email
  end

  scenario 'Leave the hotspot' do
    another = create(:user)
    hotspot = user.hotspots.create(attributes_for(:hotspot))
    hotspot.editorships.create! :user_id => another.id

    hotspot.make_admin!(user.id)
    hotspot.make_admin!(another.id)
    visit hotspot_path(hotspot)

    click_link 'Leave this Hotspot'
    expect(page).to have_css '[data-role="page-title"]', :text => 'Hotspots'
  end

  scenario 'Can not leave hotspot if no other admins exist' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).not_to have_css 'a', :text => 'Leave this Hotspot'
  end

  scenario 'Edit the Hotspot' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    within('.hotspots_menu') do
      click_link 'Edit'
    end
    fill_in 'Hotspot Name', :with => 'ABCD'
    page.check 'Accept Hotspot Terms and Conditions'
    click_button 'Update Hotspot'
    expect(page).to have_css '[data-role="page-title"]', :text => 'ABCD'
  end

  scenario 'Delete hotspot' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    click_link 'Delete'
    expect(page).to have_css '[data-role="page-title"]', :text => 'Hotspots'
  end
end

