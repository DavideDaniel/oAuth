require 'pry'
require 'sinatra'
require 'httparty'


enable :sessions
set :session_secret, 'secret_lovers'

client_id = ENV['GITHUB_CLIENT_ID']
client_secret = ENV['GITHUB']

get '/' do
	base_url = 'https://github.com/login/oauth/authorize'	
	state = SecureRandom.urlsafe_base64
	session['state'] = state

	#build a query
	query = {
		state: state,
		scope: 'user',
		client_id: client_id
	}

	encoded_query = URI.encode_www_form(query)
	@url = base_url + '?' + encoded_query
	erb :index
end

get '/oauth_callback_route' do
	if session['state'] == params['state']
		
	end
end
