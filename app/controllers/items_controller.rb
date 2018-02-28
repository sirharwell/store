class ItemsController < ApplicationController
  before_action :set_sub
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @sub.items
  end

  def show
  end

  def new
    @item = @sub.items.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @item = @sub.items.new(item_params)

    if @item.save
      redirect_to [@sub, @item]
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@sub, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to sub_items_path
  end

  private
    def set_sub
      @sub = Sub.find(params[:sub_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :body)
    end
end
