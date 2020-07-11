class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @brands = Brand.all
    @categories = Category.get_categories(nil)
    # @uploader = ImageUploader.new
  end

  def create
    # useridを付与するために再度ブランチを切り直して移植する
    binding.pry
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      flash.now[:notice] = @item.errors.full_messages
      render :new
    end
  end

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  private

  def item_params
    # ログイン機能未実装のためuser_id = 固定値としてmerge。ログイン機能実装後、current_user.idに置き換えること
    params.require(:item).permit(:name, :explanation, :price, :shipping_fee, :condition, :category_id, :brand_id, image: []).merge(user_id: 83)
  end
end
