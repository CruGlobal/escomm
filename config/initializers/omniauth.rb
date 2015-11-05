Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas, name: 'key', url: 'https://thekey.me/cas'
end
