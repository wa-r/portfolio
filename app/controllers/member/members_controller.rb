class Member::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render :edit
      flash[:notice] = "更新に失敗しました"
    end
  end

  def withdrawal
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  # ブックマーク一覧表示用
  def bookmarks
    @bookmarks = current_member.bookmarks
  end

  # フォロー画面表示用
  def follows
    member = Member.find(params[:id])
    @members = member.followings
  end

  # フォロワー画面表示用
  def followers
    member = Member.find(params[:id])
    @members = member.followers
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end
end
