class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に、空のModelオブジェクトを生成する
    @list = List.new
  end

# 投稿を保存するためのcreateアクションを作成
def create
  # データを受け取り新規登録するためのインスタンス作成
  list = List.new(list_params)
  # データをデータベースに保存するためのsaveメソッドを実行
  list.save
  # 詳細画面へリダイレクト
  redirect_to list_path(list.id)
end

  def index
    @lists = List.all
  end

  def show
    # List.all とは違い、findメソッドは引数を受け取り、idカラムと引数を比べてレコードを取得してくるメソッド
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  # 更新作業(新たなビューは不要)
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end 
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
