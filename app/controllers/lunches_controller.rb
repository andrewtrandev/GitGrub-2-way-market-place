class LunchesController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :destroy, :update]
    before_action :set_lunch, only: [:show] 
    before_action :set_user_listing, only: [:edit, :update, :destroy] #users can only edit,update,destroy their own creations


    def index
        #below two lines are used for the search form/ransack gem
        @q=Lunch.search(params[:q])
        @lunch= @q.result
    end

    def show
        #this instance variable is used to check if our favorite exists
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
            @lunch=current_user.lunches.create(lunch_params) #create a lunch using the current user
            if @lunch.errors.any? #is there any errors with creating lunch?
                render "new" #render new view
            else 
                redirect_to lunches_path #redirect to index if no errors with creating
            end
    end

    def destroy
        #@lunch=current_user.lunches.find_by_id(params[:id])  - set in private method
        @lunch.destroy
        redirect_to lunches_path
      
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
        #this one has no user authorisation so we can show individual listings to anyone
        #check if this lunch exists, if it does, set @lunch to the lunch found
        if Lunch.exists?(params[:id])
            @lunch=Lunch.find(params[:id])
        else 
            #if it does not exist then redirect to index
            redirect_to lunches_path
        end
       
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