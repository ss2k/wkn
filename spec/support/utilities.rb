def sign_up_with email, password, password_confirmation = nil
  password_confirmation ||= password
  visit root_path
  within '.nav' do
    click_link 'Sign up'
  end
  fill_in :user_email, :with => email
  fill_in :user_password, :with => password
  fill_in :user_password_confirmation, :with => password_confirmation
  click_button 'Sign up'
end

def sign_up
  sign_up_with 'person@example.com', 'password1234'
end

def sign_in_as user
  visit root_path
  fill_in :user_email, :with => user.email
  fill_in :user_password, :with => user.password
  click_button 'Sign in'
end

def complete_hotspot_form_with hotspot_name
  click_link 'Create a Hotspot'
  fill_in 'Hotspot Name', :with => hotspot_name
  page.select 'Food & Dining', :from => 'Business Category'
  fill_in 'Address1', :with => '26 Broadway'
  fill_in 'City', :with => 'New York City'
  fill_in 'State', :with => 'NY'
  fill_in 'Postal code', :with => '10004'
  page.select 'United States', :from => 'Country'
  page.check 'Accept Hotspot Terms and Conditions'
end

def complete_hotspot_form
  complete_hotspot_form_with 'Awesome Hotspot'
end

