require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before do
    @user = User.create!(user_attributes)
  end

  context "when no signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot access show" do
      get :show, id: @user

      expect(response).to redirect_to(new_session_path)
    end
  end
end
