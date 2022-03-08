class ApplicationController < ActionController::Base   
    def hello
        render html: "সুপ্রভাত নাগরিক !"
    end
end