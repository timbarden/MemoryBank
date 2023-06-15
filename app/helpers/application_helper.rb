module ApplicationHelper
    include Pagy::Frontend

    def homepage
        return current_page?(root_url)
    end

end
