OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1913795625513589", "f58a2128a02d88e92899602b72165820"
end