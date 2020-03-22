class CallbacksController < Devise::OmniauthCallbacksController

    def github
        @user = User.from_omniuath(request.env["omniauth.auth"])
        sign_in_and_redirect @user 
    end 
end 