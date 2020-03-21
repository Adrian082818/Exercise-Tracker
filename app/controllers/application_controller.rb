class ApplicationController < ActionController::Base

    def welcome
        if signed_in?
            redirect_to '/exercises'
    end 
end
