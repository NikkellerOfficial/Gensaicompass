class PerfumesController < ApplicationController
    def index
    end
  
    def new
      @perfume = Perfume.new
    end
  
    def show
      @perfume = Perfume.find_by(id: params[:id])
    end
  
    def create
      current_user.perfumes.destroy_all

      @perfume = Perfume.new(perfume_params)
      params[:perfume][:question] ? @perfume.question = params[:perfume][:question].join("") : false
      @perfume.user_id = current_user.id
      if @perfume.save
          flash[:notice] = "診断が完了しました"
          redirect_to perfume_path(@perfume.id)
      else
          redirect_to :action => "new"
      end
    end


    #def create
    #  current_user.perfumes.destroy_all
     ##if params[:perfume][:question]
    #    @perfume.question = params[:perfume][:question].join("")
    #  end
    #  @perfume.user_id = current_user.id

     # if @perfume.save
    #    # ↓ ここで診断結果に基づいて必要アイテムをセット
    #    needed_item_ids = [5,6,7] # ← 実際は診断ロジックで計算
    #    session[:needed_items] = needed_item_ids

     #   flash[:notice] = "診断が完了しました"
    #    redirect_to user_path(current_user)   # マイページに飛ばす
    #  else
     #   redirect_to :action => "new"
    #  end
    #end
  
    private
    def perfume_params
        params.require(:perfume).permit(:id, question: [])
    end
end
