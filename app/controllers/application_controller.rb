class ApplicationController < ActionController::Base   
    def hello
        render html: "Hallo Welt !"
    end
end
