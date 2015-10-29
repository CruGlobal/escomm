module Api
  module V1
    class MessagesController < ApplicationController

      def greet
        render :json => { message: "Hello from Server!" }.as_json
      end

    end
  end
end
