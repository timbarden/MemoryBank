class ApplicationController < ActionController::Base
    include Pagy::Backend

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end

    def breadcrumbs
        @breadcrumbs = []
        add_breadcrumb("Home", root_path)
    end

    def set_breadcrumbs
        breadcrumbs
    end

    def add_breadcrumb(text, path)
        @breadcrumbs << Breadcrumb.new(text, path)
    end
end
