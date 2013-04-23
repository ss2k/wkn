require 'spec_helper'

feature 'Landing pages' do
  given!(:user) { create(:user) }
  given!(:hotspot) { create(:hotspot, :user => user) }

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
end

