require 'bundler'
Bundler.require

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/app")
Dir.glob("#{File.dirname(__FILE__)}/app/*.rb")

ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :host     => "localhost",
  :database => "rales_engine_development"
)

require_all 'app'
