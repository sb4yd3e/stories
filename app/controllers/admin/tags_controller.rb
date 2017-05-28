class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.first_or_create_with_name!(tag_params[:name])
    respond_to do |format|
      format.html { redirect_to admin_tags_url }
      format.js
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_url, notice: "Successfully deleted the tag"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
