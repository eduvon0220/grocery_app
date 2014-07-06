class ListsController < ApplicationController
  def index
  	@lists = List.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @lists}
  	end
  end

  def show
  	@list = List.find(params[:id])
  	@items = @list.items
  	respond_to do |format|
  		format.html
  		format.json {render json: @items}
  	end
  end

  def new
  	@list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render action: "new"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, notice: "List was succesfully destroyed."
  end


  private

  def list_params
  	params.require(:list).permit(:name, :location)
  end
end
