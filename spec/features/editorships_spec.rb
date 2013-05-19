require 'spec_helper'

feature 'Editorships' do
  given(:user) { create(:user) }

  background do
    sign_in_as user
  end

  scenario 'Add an existing user as an editor' do
    another = create(:user)
    create_hotspot
    add_editor_to_current_hotspot(another)
    expect(page).to have_css '.editor', :text => another.email
    expect(page).not_to have_css '.admin', :text => another.email
  end

  scenario 'Remove an editor when current user is admin' do
    another = create(:user)
    create_hotspot
    add_editor_to_current_hotspot(another)
    find('.editor', :text => another.email).click_on 'Remove'
    expect(page).not_to have_css '.editor', :text => another.email
  end

  def create_hotspot
    complete_hotspot_form
    click_button 'Create Hotspot'
  end

  def add_editor_to_current_hotspot(user)
    click_link 'Manage Editors'
    fill_in :editorship_users_email, :with => user.email
    click_button 'Add'
  end
end

