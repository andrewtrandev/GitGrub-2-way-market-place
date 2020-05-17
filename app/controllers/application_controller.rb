class ApplicationController < ActionController::Base

    #defining a helper method that we can call upon in update.js.erb
    def favorite_text
        return @favorite_exists ? "Unfavorite" : "Favorite"
    end

    helper_method :favorite_text
end
