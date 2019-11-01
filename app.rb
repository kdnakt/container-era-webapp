require 'sinatra'

get '/' do
	'Hello World!'
end

get '/endpoint' do
	'New Endpoint!'
end

get '/health_check' do
	'ok'
end

