module ApplicationHelper
    def show_errors(item)
        if !item.errors.empty?
            item.errors.full_messages.join("<br>").html_safe
        end
    end
end
