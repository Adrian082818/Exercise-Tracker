class ApplicationController < ActionController::Base

    def home
        if signed_in?
            redirect_to ('/exercises')
        end 
    end 
end
