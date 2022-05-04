module UsersBackofficeHelper
    def classroom_status(is_active)
        if is_active
            status = '<color class="text-success"> Ativada </color>'
            status.html_safe
        else
            status = '<color class="text-danger"> Desativada </color>'
            status.html_safe
        end

    end
end
