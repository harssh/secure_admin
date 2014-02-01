require 'rails/generators'
require File.expand_path('../utils', __FILE__)

module SecureAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      include Rails::Generators::Migration
      include Generators::Utils::InstanceMethods
      extend Generators::Utils::ClassMethods

      argument :_model_name, :type => :string, :required => false, :desc => "Devise user model name"
      argument :_namespace, :type => :string, :required => false, :desc => "RailsAdmin url namespace"
      desc "Secure Admin installation generator"

      def install
        routes = File.open(Rails.root.join("config/routes.rb")).try :read
        initializer = (File.open(Rails.root.join("config/initializers/secure_admin.rb")) rescue nil).try :read

        display "Begining, SecureAdmin installaton process!", :blue
        display "Secure Admin needs Devise :"
        display "Checking for a devise..."
        unless defined?(Devise)
          display "Adding devise gem to your Gemfile:"
          append_file "Gemfile", "\n", :force => true
          gem 'devise'
          Bundler.with_clean_env do
            run "bundle install"
          end
        else
          display "Devise is installed already !"
        end
        unless File.exists?(Rails.root.join("config/initializers/devise.rb"))
          display "Looks like you don't have devise installed! We'll install it for you:"
          generate "devise:install"
        else
          display "Looks like you've already installed it, good!"
        end


      namespace = ask_for("Where do you want to mount secure_admin?", "admin", _namespace)
      gsub_file "config/routes.rb", /mount SecureAdmin::Engine => \'\/.+\', :as => \'secure_admin\'/, ''
      route("mount SecureAdmin::Engine => '/#{namespace}', :as => 'secure_admin'")


      end

    end
  end
end