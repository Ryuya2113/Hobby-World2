class RyuyasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def top
  end
  
    def index
        if params[:search] == nil
            @ryuyas= Ryuya.all
          elsif params[:search] == ''
            @ryuyas= Ryuya.all
          else
            #部分検索
            @ryuyas = Ryuya.where("hobby_name LIKE ? ",'%' + params[:search] + '%')
          end
    end

    def new
        @ryuya = Ryuya.new
      end
    
      def create
        ryuya = Ryuya.new(ryuya_params)
        if ryuya.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @ryuya = Ryuya.find(params[:id])
      end

      def edit
        @ryuya = Ryuya.find(params[:id])
      end

      def update
        ryuya = Ryuya.find(params[:id])
        if ryuya.update(ryuya_params)
          redirect_to :action => "show", :id => ryuya.id
        else
          redirect_to :action => "new"
        end
      end
    
      def destroy
        ryuya = Ryuya.find(params[:id])
        ryuya.destroy
        redirect_to action: :index
      end

      private
      def ryuya_params
        params.require(:ryuya).permit(:hobby_name, :genre, :price, :about, :spot, :image)
      end
end
