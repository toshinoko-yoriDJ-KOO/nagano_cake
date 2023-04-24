class Admin::TypesController < ApplicationController
# しんちゃん作成

  def index
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @type=Type.new
    # 保存されているデータ(タイプ)を全て取得
    @types=Type.all
  end


  def create
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @type=Type.new(type_params)
      # セーブに成功した時
    if @type.save
      # ジャンル一覧(indexページ)にリダイレクト
      redirect_to admin_types_path
    else
      # elseの場合,indexページを表示させたいので@typesを定義
      @types=Type.all
      # elseの場合,indexページを表示
      render 'index'
    end
  end


  def edit
    # テーブルからレコードを1行取得。引数はid
    @type=Type.find(params[:id])
  end


  def update
    # テーブルからレコードを1行取得。引数はid
    @type=Type.find(params[:id])
    # アップデートに成功した時
    if @type.update(type_params)
      # ジャンル一覧(indexページ)にリダイレクト
      redirect_to admin_types_path
    else
      # elseの場合、indexページを表示
      render 'edit'
    end
  end


  private

  def type_params
    # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:type).permit(:name)
  end

end
