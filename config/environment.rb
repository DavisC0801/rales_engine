require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :host     => "localhost",
  :database => "rales_engine_development"
)
require_all 'app'
