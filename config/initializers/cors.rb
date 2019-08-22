# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
  allow do
    origins Rails.application.config.x.cors_allowed_booking_origin, Rails.application.config.x.cors_allowed_admin_origin

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
