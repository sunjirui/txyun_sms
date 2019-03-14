module Txyun::Sms
  class InitializerGenerator < Rails::Generators::Base
    desc "This generator creates an txyun-sms initializer file at config/initializers"
    source_root File.expand_path('../../../../', __FILE__)
    def create_initializer_file
      path = "#{Rails.root}/config/initializers/txyun-sms.rb"
      template 'templates/txyun-sms.rb', path

      if File.exist?(path)
        puts 'Skipping config/initializers/txyun-sms.rb creation, as file already exists!'
      else
        puts 'Adding txyun-sms default config file (config/initializers/txyun-sms.rb)...'
        template 'templates/txyun-sms.rb', path
      end
    end
  end
end
