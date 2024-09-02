class ComentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @coments= Coment.all
end
  def new
    @coment= Coment.new
  end

  def create
    @coment = Coment.new(coment_params)
    @coment.user_id = current_user.id 
    if @coment.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  def show
    @coment= Coment.find(params[:id])
  end
  def edit
    @coment = Coment.find(params[:id])
  end
  def update
    coment = Coment.find(params[:id])
    if coment.update(coment_params)
      redirect_to :action => "show", :id => coment.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    @coment = Coment.find(params[:id])
    language.destroy
    redirect_to action: :index
  end

  private
  def coment_params
    params.require(:coment).permit(:coment_name, :grade, :about, :time,)
  end
end
