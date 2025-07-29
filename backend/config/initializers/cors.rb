Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    #el origins es el puerto de conexion entre vue y rails
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
