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
                    puts "The current array item is: #{c.isChanged}"
                    if (c.isChanged == nil)
                        c.isChanged = true
                    end
                    c.changeType = "claimed"
                    c.save
                    exp.push(c)
                    puts "The current array item is: #{c.isChanged}"
                elsif (c.code_expiry < Date.today)
                    puts "The current array item is: #{c.isChanged}"
                    if (c.isChanged == nil)
                        c.isChanged = true
                    end
                    c.changeType = "expired"
                    c.save
                    exp.push(c)
                    puts "The current array item is: #{c.isChanged}"
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
            if(c.isChanged==true)
                newNotif += 1
            end
        end
        puts "The count of notif is: #{newNotif}"
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
    
    
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    helper_method :current_user
    helper_method :check_coupon_updates
    helper_method :check_new_notif
    helper_method :quick_check_notif
    
    
end
