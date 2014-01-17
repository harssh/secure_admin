Rails.application.routes.draw do

  mount SecureAdmin::Engine => "/secure_admin"
end
