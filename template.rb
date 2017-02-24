gem "haml-rails", "~> 0.9"
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
run 'bundle install'
# generate "haml:application_layout convert"
# rake "haml:erb2haml"


# for bootstrap to work
name = ask('what is the current directory?')
run "mv ~/#{name}/#{@app_path}/app/assets/stylesheets/application.css ~/#{name}/#{@app_path}/app/assets/stylesheets/application.css.scss"
#
inject_into_file 'app/assets/stylesheets/application.css.scss', after: "*/\n" do <<-'RUBY'
 @import "bootstrap-sprockets";
 @import "bootstrap";
 @import "font-awesome";
RUBY
end
#
inject_into_file 'app/assets/javascripts/application.js', after: "require turbolinks\n" do <<-'RUBY'
//= require bootstrap-sprockets
RUBY
end


#gsub_file 'config/database.yml', '# Warning: The database defined as "test" will be erased and', 'method.the_replacing_code'
run "~/#{name}/template_pg >> ~/#{name}/#{@app_path}/config/database.yml"