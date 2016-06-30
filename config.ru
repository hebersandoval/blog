# the purpose of config.ru is to detail to Rack the environments of the app and start the app.

require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# the MethodOverride will intercept every request sent and received by our application. if it finds a request with name="_method", it will set the request type based on what is set in the value attribute
use Rack::MethodOverride
use PostsController
use UsersController
run ApplicationController
