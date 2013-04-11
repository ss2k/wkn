module SignInHelper
  def sign_in_as user
    visit root_path
    fill_in :user_email, :with => user.email
    fill_in :user_password, :with => user.password
    click_button 'Sign in'
  end
end

RSpec.configure do |c|
  c.include SignInHelper
end

