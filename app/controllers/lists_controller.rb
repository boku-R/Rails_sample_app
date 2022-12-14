class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に、空のModelオブジェクトを生成する
    @list = List.new
  end

# 投稿を保存するためのcreateアクションを作成
def create
  # データを受け取り新規登録するためのインスタンス作成
  @list = List.new(list_params)
  # データをデータベースに保存するためのsaveメソッドを実行
  # saveメソッドで、対象カラムにデータが入力されている→true　されてない→false
  if @list.save
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
  else
    # render:アクション名で、同じコントローラ内の別アクションのviewを表示できる
    render :new
  end
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

  def destroy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿一覧画面にリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
