module UsersBackofficeHelper
    def classroom_status(is_active)
        if is_active
            status = '<color class="text-success font-weight-bold"> Ativada </color>'
            status.html_safe
        else
            status = '<color class="text-danger font-weight-bold"> Desativada </color>'
            status.html_safe
        end

    end
end
