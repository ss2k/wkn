module SignUpHelper
  def sign_up_with email, password, password_confirmation = nil
    password_confirmation ||= password
    visit root_path
    click_link 'Sign up'
    fill_in :user_email, :with => email
    fill_in :user_password, :with => password
    fill_in :user_password_confirmation, :with => password_confirmation
    click_button 'Sign up'
  end

  def sign_up
    sign_up_with 'person@example.com', 'password1234'
  end
end

RSpec.configure do |c|
  c.include SignUpHelper
end

