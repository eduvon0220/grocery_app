class ItemsController < ApplicationController

	before_action :get_list

  def get_list
  	@list = List.find(params[:list_id])
  end

  def index
    @items = @list.items.all
  end

  def show
  	@item = @list.items.find(params[:id])
  end

  def new
  	@item = @list.items.new
  end

  def edit
    @item = @list.items.find(params[:id])
  end


  def create
  	@item = @list.items.new(item_params)
  	if @item.save
  		redirect_to [@list, @item]
  	else
  		render action: "new"
  	end
  end

  def update
    @item = @list.items.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @list, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def purchased
    Item.where(id: params[:item_ids]).update_all(purchased: true)
    redirect_to @list
  end

  private

  def item_params
  	params.require(:item).permit(:name, :brand, :location, :price, :quantity, :purchased)
  end

end
