require 'pry'
require 'sinatra'
require 'httparty'


enable :sessions
set :session_secret, 'secret_lovers'