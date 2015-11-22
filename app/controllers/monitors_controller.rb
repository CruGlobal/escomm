class MonitorsController < ApplicationController
  layout nil
  # newrelic_ignore

  def lb
    # User.first
    render text: 'OK'
  end
end
