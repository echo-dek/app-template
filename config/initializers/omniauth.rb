Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :apple, ENV["APPLE_AUTH_CLIENT_ID"], "", { scope: "email name", team_id: ENV["APPLE_AUTH_TEAM_ID"], key_id: ENV["APPLE_AUTH_KEY_ID"], pem: ENV["APPLE_AUTH_PRIVATE_KEY"] }
  provider :google_oauth2, ENV["GOOGLE_AUTH_CLIENT_ID"], ENV["GOOGLE_AUTH_CLIENT_SECRET"], { scope: "email, profile", prompt: "select_account", image_aspect_ratio: "square", image_size: 256, name: "google" }
  provider :microsoft_office365, ENV["OFFICE365_KEY"], ENV["OFFICE365_SECRET"]
  provider :identity, fields: [:email], model: Omniauth::Identity
end

OmniAuth::AuthenticityTokenProtection.default_options(key: "csrf.token", authenticity_param: "_csrf")
OmniAuth.config.logger = Rails.logger
