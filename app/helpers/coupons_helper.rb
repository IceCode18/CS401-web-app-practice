module CouponsHelper
    def publishButtonName(published)
        if published
           "Unpublish"
        else
            "Publish"
        end
    end
end
