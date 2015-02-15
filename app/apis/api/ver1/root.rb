module API
  module Ver1
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1'
      format :json

      # Helper for devise
      helpers do
        def warden
          env['warden']
        end

        def current_user
          warden.user || @user
        end

        def authenticate!
          error!('401 Unauthorized', 401) unless current_user
        end

        def present!(id)
          error!('400 Invalid Task Id', 400) unless Task.exists?(id: id)
        end
      end

      mount API::Ver1::Tasks
    end
  end
end
