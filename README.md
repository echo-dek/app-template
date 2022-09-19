# README

Template for a Rails app

* Ruby 3.1.2, using Docker to load up all dependencies (Dockerfile and docker-compose)

## Authentication

Uses OmniAuth with strategies for Google, Apple and Office365 preloaded. 

Create your User model and make sure it has relations for:
- `has_many :providers, class_name: 'Omniauth::Provider', as: :authenticable, dependent: :destroy`
- `has_many :identities, class_name: 'Omniauth::Identity', as: :authenticable, dependent: :destroy`

The SessionsController will then use the incoming Provider/UID from OmniAuth to find your model and it will then set a session cookie.  If your model is called User then the cookie will be "user_id", if the model is called Person then the cookie will be "person_id" etc.  

If it cannot find Provider/UID combination from OmniAuth it will raise a SessionsController::AuthenticationFailed exception.  

However, both finding models and responding to models not being found can be customised.  Set up an initializer, `config/initializers/authentication.rb` that defines two callbacks: 

```
Rails.application.config.omniauth_find_user = ->(auth_data) { 
  User.find_by(some_field: auth_data[:some_field])
}

Rails.application.config.omniauth_create_user = ->(auth_data) { 
  User.create!(some_field: auth_data[:some_field])
}

```

### Environment Variables needed

#### Apple
- APPLE_AUTH_CLIENT_ID
- APPLE_AUTH_TEAM_ID
- APPLE_AUTH_KEY_ID
- APPLE_AUTH_PRIVATE_KEY

#### Google
- GOOGLE_AUTH_CLIENT_ID
- GOOGLE_AUTH_CLIENT_SECRET

#### Office 365
- OFFICE365_KEY
- OFFICE365_SECRET
