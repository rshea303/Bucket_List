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

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
