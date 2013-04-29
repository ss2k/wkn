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
end

