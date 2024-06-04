class PoohsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
    def index
        @poohs = Pooh.all
      if params[:tag]
        Tag.create(name: params[:tag], category: params[:category])
      end

      if params[:tag_ids]
        @poohs = []
        params[:tag_ids].each do |key, value|      
          @poohs += Tag.find_by(name: key).poohs if value == "1"
        end
        @poohs.uniq!
      end
    end

    def new
        @pooh = Pooh.new
      end
    
      def create
        @pooh = Pooh.new(pooh_params)
        
        @pooh.user_id = current_user.id

        if @pooh.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @pooh = Pooh.find(params[:id])
      end

      def edit
        @pooh = Pooh.find(params[:id])
      end

      def update
        pooh = Pooh.find(params[:id])
        if pooh.update(pooh_params)
          redirect_to :action => "show", :id => pooh.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        pooh = Pooh.find(params[:id])
        pooh.destroy
        redirect_to action: :index
      end

      private
      def pooh_params
        params.require(:pooh).permit(:food_name, :gi_value, :energy, :protein, :lipid, :carbo, :salt, :effect, :treat, :recipe, :created_at, :image, :beauty, :pain, :recovery, :mental, :woman, :nil, tag_ids: [])
      end
 
end
