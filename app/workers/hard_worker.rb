class HardWorker
  include Sidekiq::Worker

  def perform(h, count)
  	print "Hello World\n"
    h = JSON.load(h)
    UserMailer.send_email(h['name'], h['email'], h['message']).deliver
  end
end