require './config/environment'

if ActiveRecord::Migrations.needs_migration?
  raise 'Migrations are pending. Run 'rake db:migrate' to resolve the issue.'
end

run ApplicationController
