class BiosController < ApplicationController
  # before_action :set_bio, only: [:update, :edit, :show]
  
  def index
   
  end

  def create
    @bio = Bio.new(bio_params)
    @bio.user_id = current_user.id
    if @bio.save
      redirect_to bio_path([:id])
    else
      render partial: "form"
    end
  end

  def update
    @bio = Bio.find(params[:id])
    @bio.user_id = current_user.id
    if @bio.update(bio_params)
      redirect_to @bio
    else
      redirect :edit
    end
  end

  def destroy
  end

  def show
    @user = current_user
    @bio = Bio.find(params[:id])
  end

  def edit
    @bio = Bio.find(params[:id])
    @bio.user_id = current_user.id
    render partial: "form"
  end

  def new
    @bio = Bio.new
    render partial: "form"
  end

  private
  def bio_params
    params.require(:bio).permit(:profile_image, :description)
  end

  def set_bio
    @bio = current_user.bios.find(params[:bio_id])
  end

end
