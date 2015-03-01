module API
  module Ver1
    module Entities
      class Root < Grape::API

        mount API::Ver1::Entities::Tasks
      end
    end
  end
end
