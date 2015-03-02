module API
  module Ver2
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v2'
      format :json

      mount API::Ver2::Entities::Root
    end
  end
end
