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

