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
    
    #check user passes if any of them are expired or have been claimed
    def check_coupon_updates
        exp = []
        current_user.passes.each do |p|
            p.coupons.each do |c|
                if(c.claimer != "")
                    if (c.isChanged == nil)
                        c.isChanged = true
                    end
                    c.changeType = "claimed"
                    exp.push(c)
                    puts "The current array item is: #{c.changeType}"
                elsif (c.code_expiry < Date.today)
                    if (c.isChanged == nil)
                        c.isChanged = true
                    end
                    c.changeType = "expired"
                    exp.push(c)
                    puts "The current array item is: #{c.changeType}"
                end
                
            end
        end
        exp
    end
    
    #Checks if there new notifications
    def check_new_notif
        newNotif = 0
        notif = check_coupon_updates
        notif.each do |c|
            if(c.isChanged)
                newNotif += 1
            end
        end
        newNotif
    end
    
    #Checks if there are notifications
    def quick_check_notif
        changedCoupons = check_coupon_updates
        if changedCoupons.length > 0
            return 1
        end
        return 0
    end
    
    #Resets number of new notifications
    def resetNotifCount
        notif = check_coupon_updates
        notif.each do |c|
            if(c.isChanged)
                c.isChanged = false
            end
        end
    end
    
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    helper_method :current_user
    helper_method :check_coupon_updates
    helper_method :check_new_notif
    helper_method :quick_check_notif
    helper_method :resetNotifCount
    
    
end
