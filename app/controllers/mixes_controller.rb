class MixesController < ApplicationController
  include MixesHelper

  def index
    @user = User.find(params[:user_id])
    @mixes = @user.mixes
  end
  def new
    @mix = Mix.new
    redirect_to '/login' unless (access)
  end
  def create
    @mix = current_user.mixes.find_or_create_by(mix_params)
    if @mix.valid?
      if params[:content]
        content =  Content.find_or_create_by(content_params)
        @mix.contents <<  content unless @mix.contents.include?(content)
      else
        redirect_to user_mix_path(current_user, @mix)
      end
    else
      render :new
    end
    
  end

  def show
    @mix = Mix.find(params[:id])
  end

  def edit
    @mix = Mix.find(params[:id])
    redirect_to '/login' unless (access)
  end

  def update

    @mix = Mix.find(params[:id])
    # @mix.contents = []
    @mix.update(mix_update_params)
    redirect_to user_mix_path(current_user, @mix)
  end

  private

  def mix_params
    params.require(:mix).permit(:title)
  end

  def content_params
    params.require(:content).permit(:data_type, :title, {creators: []}, :date, :image, :url, :description)
  end

  def mix_update_params
    params.require(:mix).permit(:title, :description)
  end
end
