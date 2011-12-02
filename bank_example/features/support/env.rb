require 'capybara'
require 'capybara/dsl'
require 'sinatra'

Capybara.app = Sinatra::Application

Capybara.driver = :selenium
