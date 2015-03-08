require 'rails_helper'

describe "a user" do
  it "has an idea" do
    user = User.create!(user_attributes)
    user.ideas.new(title: "NewIdea", description: "greatest idea ever")
    expect(user.ideas.first.title).to eq("NewIdea")
    expect(user.ideas.first.description).to eq("greatest idea ever")
  end

  it "has many ideas" do
    user = User.create!(user_attributes)
    user.ideas.new(title: "NewIdea", description: "greatest idea ever")
    user.ideas.new(title: "SecondIdea", description: "second best idea ever")
    expect(user.ideas.first.title).to eq("NewIdea")
    expect(user.ideas.last.title).to eq("SecondIdea")
  end

  it "lists ideas on page" do
    user = User.create!(user_attributes)
    user.ideas.create!(title: "NewIdea", description: "greatest idea ever")
    user.ideas.create!(title: "SecondIdea", description: "second best idea ever")
 
    visit '/'
    click_link_or_button("Login")
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
    
    expect(page).to have_text("NewIdea")
    expect(page).to have_text("SecondIdea")
  end

end
