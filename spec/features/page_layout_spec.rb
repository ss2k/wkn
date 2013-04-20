require 'spec_helper'

feature 'Page layout' do

  scenario 'Display application name at title' do
    visit root_path
    title = find('title').native.text
    expect(title).to have_content('WiFi-K9')
  end
end

