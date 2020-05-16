class AddressesController < ApplicationController
before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

    def show
        @address=Address.find_by(user_id: current_user[:id])
        if @address == nil
            redirect_to new_address_path
        end
    end

    def new 
        @address=Address.new
    end

    def create
            @address=current_user.create_address(address_params) #have to use create_address since the association is a has_one 
            if @address.errors.any? #is there any errors with creating address?
          
                render "new" #render new view
            else 
                redirect_to lunches_path# redirect_to addresses_path #redirect to index if no errors with creating
            end
    end

    def edit
        @address=Address.find_by(user_id: current_user[:id])
        if @address == nil
            redirect_to new_address_path
        end
    end

    def update
        @address=Address.update(params[:id]. address_params)

        if @lunch.errors.any?
            render "edit"
        else
            redirect_to view_address_path
        end
    end




    private

    def address_params
        params.require(:address).permit(:street, :suburb, :postcode, :state, :user_id)
        #whitelisting attributes, a list of things that are allowed
        #which parameters are we going to permit for :lunch 
    end


end