require 'spec_helper'

feature 'Editorships' do
  given(:user) { create(:user) }

  background do
    sign_in_as user
  end

  scenario 'Hotspot creator is automatically an editor' do
    complete_hotspot_form
    click_button 'Create Hotspot'
    expect(page).to have_css '.editor', :text => user.email
  end

  scenario 'A non editor is not listed in the list of editors' do
    not_an_editor = create(:user)
    complete_hotspot_form
    expect(page).not_to have_css '.editor', :text => not_an_editor.email
  end

  scenario 'Add an existing user as an editor' do
    another = create(:user)
    complete_hotspot_form
    click_button 'Create Hotspot'
    fill_in :editorship_user_email, :with => another.email
    click_button 'Add'
    expect(page).to have_css '.editor', :text => another.email
  end
end

