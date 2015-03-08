require 'rails_helper'

describe "a user" do
  it "has an idea" do
    user = User.create!(user_attributes)
    user.ideas.new(title: "NewIdea", description: "greatest idea ever")
    expect(user.ideas.first.title).to eq("NewIdea")
    expect(user.ideas.first.description).to eq("greatest idea ever")
  end
end
