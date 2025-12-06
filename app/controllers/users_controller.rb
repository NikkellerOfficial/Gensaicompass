class UsersController < ApplicationController
  #def show
  #  @user = User.find(params[:id])
   # @items = @user.items   # current_user ではなく @user.items のほうが自然
#
 #   if params[:search].present?
  #    @items = @items.where(category: params[:search])
   # end
  #end



  def show
    @user = User.find(params[:id])

    # ① 診断で必要とされたアイテムをまず抽出
    if session[:needed_items].present?
      @items = Item.where(id: session[:needed_items])
    else
      @items = @user.items   # fallback
    end

    # ② 絞り込み
    if params[:search].present?
      @items = @items.where(category: params[:search])
    end
  end


end
