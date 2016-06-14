module Api
  module V1
    class ItemsController < Api::ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params['id'])
      end

      def destroy
        respond_with Item.find(params['id']), method: :delete
      end
    end
  end
end
