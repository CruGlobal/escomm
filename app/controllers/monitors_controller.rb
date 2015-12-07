class MonitorsController < ApplicationController
  layout nil
  # newrelic_ignore

  def lb
    # User.first
    render text: 'OK'
  end

  def commit
    # This is a handy endpoint for checking which git commit is deployed for
    # debugging purposes.
    render text: ENV['GIT_COMMIT']
  end
end
