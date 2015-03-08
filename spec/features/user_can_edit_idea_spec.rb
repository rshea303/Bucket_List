require 'rails_helper'

describe "a user" do
  it "can edit an existing idea" do
    user = User.create(user_attributes)
    idea1 = user.ideas.create(title: "idea1", description: "desc1")
    
    visit '/'

    click_link_or_button('Login')
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button('Submit')
    click_link_or_button('Edit')

    expect(current_path).to eq(edit_idea_path(idea1))
    fill_in "Title", with: "updatedidea1title"
    fill_in "Description", with: "updatedidea1desc"
    click_link_or_button('Submit')
    expect(page).to have_text('updatedidea1title')
    expect(page).not_to have_text('desc1')  
  end
end
