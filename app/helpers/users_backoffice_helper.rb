module UsersBackofficeHelper
    
    def classroom_statuss(classroom)
        if classroom.is_active
            status = '<color id=status-color' + classroom.id.to_s + ' class="text-success font-weight-bold"> Ativada </color>'
            
            status.html_safe
        else
            status = '<color id=' + classroom.id.to_s + ' class="text-danger font-weight-bold"> Desativada </color>'
            
            status.html_safe
        end
    end
    def classroom_status(classroom)
        if classroom.is_active
            status ='<div class="custom-control custom-switch">
                        <input type="checkbox" checked class="custom-control-input" id=' + classroom.id.to_s + '>
                        <label class="custom-control-label text-success font-weight-bold" for=' + classroom.id.to_s + '> Ativada </label>
                    </div>'
            
            status.html_safe
        else
            status ='<div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id=' + classroom.id.to_s + '>
                        <label class="custom-control-label text-danger font-weight-bold" for=' + classroom.id.to_s + '> Desativada </label>
                    </div>'
            status.html_safe
        end
    end
    
end

                        