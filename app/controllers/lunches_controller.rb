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

    def new 
        @lunch=Lunch.new
        #instance var that we'll pass to view
    end

    def create
        # @lunch=Lunch.create(name: params[:name], description: params[:description], price: params[:price])
        #above line of code doesn't work with new form - kept creating null records, but after setting listing_params and using below code it works.
        @lunch=Lunch.create(listing_params)
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

        params.require(:lunch).permit(:name, :description, :price)
        #this tell the form what parameters 
    end

end