require 'spec_helper'

feature 'Landing pages' do
  given!(:user) { create(:user) }
  given!(:hotspot) { user.hotspots.create(:name => 'abcd', :category => 'Education') }

  before do
    sign_in_as user
    click_link hotspot.name
  end

  scenario 'Create a landing page with tinymce' do
    click_link 'Create a Landing Page'
    expect(page).to have_css '#landing_title'
    expect(page).to have_css '#landing_markup'
    expect(page).to have_css '.tinymce'
  end

  scenario 'Create and submit a new landing page' do
    create_landing_page_with 'Main Landing Page', '<p>Hello</p>'
    expect(page).to have_css '.landing-title', :text => 'Main Landing Page'
    expect(page).to have_css '.landing-markup', :text => 'Hello'
  end

  scenario 'Edit landing page' do
    create_landing_page
    within('.landing') do
      click_link 'Edit'
    end
    fill_in 'Title', :with => 'New Title'
    fill_in 'Customization', :with => '<p>Abracadabra</p>'
    click_button 'Update Landing'
    expect(page).to have_css '.landing-title', :text => 'New Title'
    expect(page).to have_css '.landing-markup', :text => 'Abracadabra'
  end

  def create_landing_page
    create_landing_page_with 'Main Landing Page', '<p>Hello</p>'
  end

  def create_landing_page_with title, content
    click_link 'Create a Landing Page'
    fill_in 'Title', :with => title
    fill_in 'Customization', :with => content
    click_button 'Create Landing'
  end
end

