Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, "id", "secret"
end