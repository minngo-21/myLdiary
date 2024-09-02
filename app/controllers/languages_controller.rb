class LanguagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @languages = Language.all
    if params[:tag_ids]
      @languages = []
      params[:tag_ids].each do |key, value|      
        @languages += Tag.find_by(name: key).languages if value == "1"
      end
      @languages.uniq!
    end
    if params[:tag_ids]
      @languages = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_languages = Tag.find_by(name: key).languages
          @languages = @languages.empty? ? tag_languages : @languages & tag_languages
        end
      end
      if params[:search] == nil
        @languages= Language.all
      elsif params[:search] == ''
        @languages= Language.all
      else
      
        @languages = Language.where("body LIKE ? ",'%' + params[:search] + '%')
      end
    end
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end
  def new
    @language= Language.new
  end

  def create
    language = Language.new(language_params)
    language.user_id = current_user.id
    if language.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @language= Language.find(params[:id])
  end
  def edit
    @language = Language.find(params[:id])
  end
  def update
    language = Language.find(params[:id])
    if language.update(language_params)
      redirect_to :action => "show", :id => language.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    language= Language.find(params[:id])
    language.destroy
    redirect_to action: :index
  end
  private
  def language_params
    params.require(:language).permit(:post_name, :grade, :about, :image, :user_id,tag_ids:[])
  end
end
