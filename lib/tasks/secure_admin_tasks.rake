# desc "Explaining what the task does"
# task :secure_admin do
#   # Task goes here
# end

namespace :secure_admin do
  
  desc "Install secure_admin"
  task :install do
    system 'rails g secure_admin:install'
  end

  desc "Uninstall secure_admin"
  task :uninstall do
    system 'rails g secure_admin:uninstall'
  end
  
end