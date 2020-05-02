class LunchesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_lunch, only: [:show, :destroy, :update]
    #before any methods get called set @lunch=Lunch.find(params[:id])


    def index
        @lunch=Lunch.all
        render json: @lunch
    end

    def show
        # @lunch=Lunch.find(params[:id])
        render json: @lunch
    end

    def new 
        @lunch=Lunch.new
        #instance var that we'll pass to view
    end

    def create
        # @lunch=Lunch.create(name: params[:name], description: params[:description], price: params[:price])
        #above line of code doesn't work with new form - kept creating null records, but after setting listing_params and using below code it works.
        
        @lunch=Lunch.create(lunch_params)
        if @lunch.errors.any? #is there any errors with creating lunch?
            render "new" #render new view
        else 
            redirect_to lunches_path #redirect to index if no errors with creating
        end
    end

    def destroy
    #   Lunch.find(params[:id]).destroy'
        @lunch.destroy
       render json: "destroyed a lunch"
        #only need instance variables if we're going to pass them to the view???
    end

    def update
        @lunch.update(name: params[:name], description: params[:description], price: params[:price])
    end

    def edit
    
    end


    private
    def lunch_params
        params.require(:lunch).permit(:name, :description, :price)
        #whitelisting attributes, a list of things that are allowed
    end


    def set_lunch
        @lunch=Lunch.find(params[:id])
        #using this method to dry up code as we use Lunch.find alot
        #called at the top
    end

end