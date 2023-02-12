class HobbysController < ApplicationController
    def index
        @hobbys = Hobby.all
    end

    def new
        @hobby = Hobby.new
      end
    
      def create
        hobby = Hobby.new(hobby_params)
        if hobby.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def hobby_params
        params.require(:hobby).permit(:hobby_name, :genre, :price, :about, :spot)
      end
end
