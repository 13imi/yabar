module API
  module Ver2
    module Entities
      class Root < Grape::API

        mount API::Ver2::Entities::Tasks
      end
    end
  end
end
