class ApplicationController < ActionController::Base
    
    
    private
    
    def authenticate
        unless current_user
            session[:protected_page] = request.url
            redirect_to login_path, alert: "You need to login to view this page."
        end
    end
    
    def login(user)
        session[:user_id] = user.id
        check_expired_coupons
    end
    
    def logout
        session[:user_id] = nil
    end
    #Notifications is this really needed?
    #code
    #codeID
    #passID
    #read
    #type
    #interactingUser
    def check_expired_coupons
        #check user passes if any of them are expired
        exp = []
        current_user.passes.each do |p|
            p.coupons.each do |c|
                exp.push(c)
                puts "The current array item is: #{c.code_expiry}"
            end
        end
        exp
    end
    
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    helper_method :current_user
    helper_method :check_expired_coupons
    
    
end
