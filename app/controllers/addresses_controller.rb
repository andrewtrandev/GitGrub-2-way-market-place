class AddressesController < ApplicationController

    def show
        # @address=current_user.addresses.find_by_id(params[:id])
        render json: "test"
    end

    def new 
        @address=Address.new
    end

    def create
        @address=current_user.addresses.create(address_params)
    end

end