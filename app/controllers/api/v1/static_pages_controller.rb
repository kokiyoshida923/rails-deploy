module Api
  module V1
    class StaticPagesController < ApplicationController
      def home
        message = 'Hello world'
        render json: { message: message }
      end
    end
  end
end
