class ItemsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]


    def index
      # 診断結果が存在する場合（優先）
      if session[:needed_items].present?
        @items = Item.where(id: session[:needed_items])
      else
        @items = Item.all
      end

      # さらに絞り込み（任意ワード検索）
      if params[:search].present?
        @items = @items.where("category LIKE ?", "%#{params[:search]}%")
      end
    end


    #def index
     # if params[:search] == nil
      #  @items= Item.all
      #elsif params[:search] == ''
     #   @items= Item.all
      #else
        #部分検索
      #  @items = Item.where("category LIKE ? ",'%' + params[:search] + '%')
      #end
    #end

    
    def new
      @item = Item.new  # @items ではなく、単数形の @item に Item.new を代入
    end

    


    def create
        item = Item.new(item_params)

        item.user_id = current_user.id


        if item.save!
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
    @item = Item.find(params[:id])
    end


    def edit
    @item = Item.find(params[:id])
    end

    def update
        item = Item.find(params[:id])
        if item.update(item_params)
        redirect_to :action => "show", :id => item.id
        else
        redirect_to :action => "new"
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        redirect_to action: :index
    end

    private
    def item_params
        params.require(:item).permit(:name, :category, :about, :number_person,:unit,:speciality,:phase, :image)
    end

end
