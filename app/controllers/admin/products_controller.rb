class Admin::ProductsController < ApplicationController
  # しんちゃん作成
  # before_action :authenticate_admin!

  def index
    # ページネーションの設定
    @products = Product.page(params[:page]).reverse_order
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @product = Product.new
  end

  def create
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @product = Product.new(product_params)
    # セーブに成功した時
    if @product.save
      # 商品詳細(showページ)にリダイレクト
      redirect_to admin_products_path(@product)
    else
      # elseの場合,newページを表示
      render :new
    end
  end

  def show
    # テーブルからレコードを1行取得。引数はid
    @product = Product.find(params[:id])
  end

  def edit
    # テーブルからレコードを1行取得。引数はid
    @product = Product.find(params[:id])
  end


  private

  def product_params
    # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:product).permit(:image, :name, :description, :type_id, :price, :is_active)
  end
end