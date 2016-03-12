require_relative './config/environment'
require_relative './app/user_info'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UserController
use PatternController
run ApplicationController