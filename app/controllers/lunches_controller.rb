class LunchesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @lunch=Lunch.all
        render json: @lunch
    end

    def show
        @lunch=Lunch.find(params[:id])
        render json: @lunch
    end

    
    def create
        @lunch=Lunch.create(name: params[:name], description: params[:description], price: params[:price])
        render json: @lunch
    end

    def destroy
      Lunch.find(params[:id]).destroy
       render json: "destroyed a lunch"
        #only need instance variables if we're going to pass them to the view???
    end

    def update
        @lunch=Lunch.find(params[:id])
        @lunch.update(name: params[:name], description: params[:description], price: params[:price])
    end

    private
    def listing_params

        # params.require(:lunch).permit(:name, :description, :price)
        #not too sure what this does, think it's more to do with the form???
    end

end