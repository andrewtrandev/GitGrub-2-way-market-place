class LunchesController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :destroy, :update]
    # skip_before_action :verify_authenticity_token
    before_action :set_lunch, only: [:show] 
    before_action :set_user_listing, only: [:edit, :update, :destroy] #users can only edit,update,destroy their own creations


    def index
        @lunch=Lunch.all
    end

    def show
        @favorite_exists = Favorite.where(lunch: @lunch, user: current_user) == [] ? false :  true
        #app would error because unlogged users had no current email
        if user_signed_in?
            stripe_checkout
        end
    end

    def new 
            @lunch=Lunch.new
        #instance var that we'll pass to view
    end

    def create
        # @lunch=Lunch.create(name: params[:name], description: params[:description], price: params[:price])
        #above line of code doesn't work with new form - kept creating null records, but after setting listing_params and using below code it works.
            @lunch=current_user.lunches.create(lunch_params)
            if @lunch.errors.any? #is there any errors with creating lunch?
                render "new" #render new view
            else 
                redirect_to lunches_path #redirect to index if no errors with creating
            end
    end

    def destroy
    # Lunch.find(params[:id]).destroy
        @lunch.destroy
        redirect_to lunches_path
        #only need instance variables if we're going to pass them to the view???
    end

    def update
        @lunch=Lunch.update(params[:id], lunch_params)
        #note the format of this is important, params["id"] is the entry we're updating, lunch params are what we're updating
        if @lunch.errors.any? #is there any errors with updating lunch?
            render "edit" #render edit view
        else 
            redirect_to lunches_path #redirect to index if no errors with updating
        end
    end

    def edit
        
    end

    private
    def lunch_params
        params.require(:lunch).permit(:name, :description, :price, :picture, :street, :suburb, :state, :postcode)
        #whitelisting attributes, a list of things that are allowed
        #which parameters are we going to permit for :lunch 
    end


    def set_lunch
        #check if this lunch exists, if it does set @lunch to the lunch found
        if Lunch.exists?(params[:id])
            @lunch=Lunch.find(params[:id])
        else 
            #if it does not exist then redirect to index
            redirect_to lunches_path
        end
        #using this method to dry up code as we use Lunch.find alot
        #called at the top
    end

    def set_user_listing
        @lunch=current_user.lunches.find_by_id(params[:id])
        #set @lunch to find the id of any lunches created by the current user

        if @lunch == nil
            redirect_to lunches_path #send user to index if can't be found
        end
    end
    
    def stripe_checkout
            session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @lunch.name,
                description: @lunch.description,
                amount: @lunch.price * 100,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    lunch_id: @lunch.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&lunchId=#{@lunch.id}",
            cancel_url: "#{root_url}lunches"
        )
        @session_id = session.id
    end


end