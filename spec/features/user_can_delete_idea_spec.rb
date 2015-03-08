require 'rails_helper'

describe "a user" do
  it "can delete an existing idea" do
    user = User.create(user_attributes)
    idea1 = user.ideas.create(title: "idea1", description: "desc1")
    
    visit '/'

    click_link_or_button('Login')
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button('Submit')
    click_link_or_button('Delete')

    expect(page).not_to have_text('desc1')  
    expect(page).not_to have_text('idea1')
  end
end
