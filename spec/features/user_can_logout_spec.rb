require 'rails_helper'

describe "a user" do

  it "can logout" do
    user = User.create!(user_attributes)

    visit '/'
    click_link_or_button('Login')
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button('Submit')
    
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Login')

    click_link_or_button('Logout')

    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Login')
  end
end
