module ApplicationHelper
    def attribute_name(object = nil, method = nil)
        if object && method
            object.model.human_attribute_name(method)
        else
            "Informe os parametros corretamente"
        end
    end

    def dt_br(data_time)
        data_time.strftime("%d-%m-%y")
    end
end
