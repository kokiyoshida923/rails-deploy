module Api
  module V1
    class StaticPagesController < ApplicationController
      def home
        message = 'Deployment was successful'
        render json: { message: message }
      end
    end
  end
end
