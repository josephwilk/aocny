ENV['RAILS_ENV'] = RAILS_ENV = 'test'

require 'cucumber/rails'
require File.dirname(__FILE__) + "/factories"

Capybara.default_selector = :css
ActionController::Base.allow_rescue = false

WantWorkshop::Factories.init

module DSL
end

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

if ENV['FULL_STACK']
  puts "[INFO] FULL_STACK=true Full Stack testing"
else
  puts "[INFO] FULL_STACK=false Testing Under the GUI"
end

def workshop_under_discussion(name = nil)
  if name
    workshop = Workshop.find_by_name(name)
  else
    raise Exception.new("I don't know which workshop you mean. You have more than one!") if Workshop.count > 1
    Workshop.first
  end
end