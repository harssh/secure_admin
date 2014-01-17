require 'rails'
require 'secure_admin'

module SecureAdmin
  class Engine < ::Rails::Engine
    isolate_namespace SecureAdmin
  end
end
