require 'rails_helper'

describe "a visitor" do

  it "can register for an account" do
    visit '/'
    click_link_or_button('Register')
    expect(current_path).to eq(new_user_path)
    
    fill_in "Name", with: "BrandNewUser"
    fill_in "Email", with: "brandnewuser@example.com"
    fill_in "Password", with: "password"

    click_link_or_button('Submit')
    expect(page).to have_text('BrandNewUser')
  end
end
