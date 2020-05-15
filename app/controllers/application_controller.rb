class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = "Not authorized to perform that action"
        redirect_to root_path
    end

end
