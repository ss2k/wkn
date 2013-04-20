require 'spec_helper'

describe ApplicationHelper, '#viewable_flash' do
  it 'Contains notice' do
    flash.notice = 'Success!'
    expect(viewable_flash[:notice]).to eq 'Success!'
  end

  it 'Contains alert' do
    flash.alert = 'Danger!'
    expect(viewable_flash[:alert]).to eq 'Danger!'
  end

  it 'Does not contain keys other than notice and alert' do
    flash[:invalid_key] = 'You should not see this'
    expect(viewable_flash).to_not include(:invalid_key)
  end
end

describe ApplicationHelper, '#full_title' do
  it 'Includes the page title' do
    expect(full_title('abcd')).to match /abcd$/
  end

  it 'Includes the base title' do
    expect(full_title('efgh')).to match /^WiFi-K9/
  end

  it 'Does not include the page title when empty' do
    expect(full_title).to eq 'WiFi-K9'
  end
end

