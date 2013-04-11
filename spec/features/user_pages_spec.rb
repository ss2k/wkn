require 'spec_helper'

feature 'User registration' do

  scenario 'Sign up with valid email and password' do
    sign_up_with 'person@example.com', 'password1234'
    expect(page).to have_css '.current_user', :text => 'person@example.com'
  end

  scenario 'Reject sign up with invalid email' do
    sign_up_with 'foo', 'password1234'
    user_sees_sign_up_page
  end

  scenario 'Reject sign up with invalid password' do
    sign_up_with 'person@example.com', 'a'
    user_sees_sign_up_page
  end

  scenario 'Reject up with invalid password confirmation' do
    sign_up_with 'person@example.com', 'password1234', 'foo'
    user_sees_sign_up_page
  end

  scenario 'Allow unconfirmed access for 30 minutes' do
    sign_up
    Timecop.freeze Time.now + 29.minutes do
      visit root_path
      expect(page).to have_css '.current_user'
    end
  end

  scenario 'Require confirmation 30 minutes after sign up' do
    sign_up
    Timecop.freeze Time.now + 30.minutes do
      visit root_path
      user_sees_sign_in_page
    end
  end

  def user_sees_sign_up_page
    expect(page).to have_css 'h2', :text => 'Sign up'
    expect(page).to have_css '#user_email'
    expect(page).to have_css '#user_password'
    expect(page).to have_css '#user_password_confirmation'
  end

  def user_sees_sign_in_page
    expect(page).to have_css 'h2', :text => 'Sign in'
    expect(page).to have_css '#user_email'
    expect(page).to have_css '#user_password'
  end
end

