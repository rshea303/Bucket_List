require 'rails_helper'

describe "A user" do
  it "can login" do
    user = User.create!(user_attributes)
    visit '/'
    click_link_or_button("Login")
    expect(current_path).to eq(new_session_path)
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
  end

  it "can login and be directed to their own page" do
    user = User.create!(user_attributes)
    visit '/'
    click_link_or_button("Login")
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
    expect(page).to have_text(user.name)
  end
end
