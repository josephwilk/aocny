require 'capybara'
require 'capybara/dsl'
require 'sinatra'

Capybara.app = Sinatra::Application
