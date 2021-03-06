module ShortenerError
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from Exception do |e|
          fatal_error(e)
        end
        rescue_from ActionController::ParameterMissing, with: :parameters_missing
        rescue_from ActionController::RoutingError, with: :route_not_found
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ArgumentError, with: :argument_error
        rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
        rescue_from ShortenerError::ValidationError, with: :validation_error
      end
    end

    private

    def respond(message, status)
      render json: { success: false,
                     code: status,
                     info: {
                       message: message,
                       type: 'error'
                     } }, status: status
    end

    def invalid_record(exception)
      respond(exception.record.errors.messages.map { |_, v| v.join(',') }.join(','), 400)
    end

    def argument_error(exception)
      respond(exception.message, 400)
    end

    def validation_error(exception)
      Rails.logger.debug("#{exception.klass} (#{exception.kind}) - #{exception.message}")
      respond(exception.message, 400)
    end

    def record_not_found
      respond('No se encontró ningún registro con ese identificador!', 400)
    end

    def parameters_missing
      respond('Hacen falta parámetros para completar la petición!', 400)
    end

    def route_not_found
      respond('No existe la acción que estas buscando!', 404)
    end

    def fatal_error(exception)
      Rails.logger.debug(exception)
      respond(
          'Hubo un error con la aplicación, si el problema persiste ponte en contacto con nuestro equipo.',
          500
      )
    end

  end
end