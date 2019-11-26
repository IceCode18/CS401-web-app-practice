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
    end
    
    def logout
        session[:user_id] = nil
    end
    
    def check_coupon_updates
        #check user passes if any of them are expired
        exp = []
        current_user.passes.each do |p|
            p.coupons.each do |c|
                if(c.claimer != "")
                    c.isChanged = true
                    c.changeType = "claimed"
                    exp.push(c)
                    puts "The current array item is: #{c.changeType}"
                elsif (c.code_expiry < Date.today)
                    c.isChanged = true
                    c.changeType = "expired"
                    exp.push(c)
                    puts "The current array item is: #{c.changeType}"
                end
                
            end
        end
        exp
    end
    
    def check_new_notif
        newNotif = 0
        expired = check_coupon_updates
            expired.each do |c|
                if(c.isChanged)
                    newNotif += 1
                end
            end
        newNotif
    end
    
    def quick_check_new_notif
        expired = check_coupon_updates
        expired.each do |c|
            if(c.isChanged)
                return 1
            end
        end
        return 0
    end
    
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    helper_method :current_user
    helper_method :check_coupon_updates
    helper_method :check_new_notif
    helper_method :quick_check_new_notif
    
    
end
