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
    click_link 'Create a Landing Page'
    fill_in 'Title', :with => 'Main Landing Page'
    fill_in 'Customization', :with => '<p>Hello</p>'
    click_button 'Create Landing'
    expect(page).to have_css '.landing-title', :text => 'Main Landing Page'
    expect(page).to have_css '.landing-markup', :text => 'Hello'
  end
end

