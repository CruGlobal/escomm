module Api
  module V1
    class MessagesController < ApplicationController

      def greet
      	render :json => { fname: User.find(1).fname}.as_json
      end

    end
  end
end
