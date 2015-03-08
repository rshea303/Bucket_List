class IdeasController < ApplicationController
  def new 
    @idea = Idea.new
  end

  def create
    idea = current_user.ideas.new(idea_params)
    if idea.save!
      redirect_to user_path(current_user) 
    else
      render :new
    end
  end

private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
