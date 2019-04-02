require 'sinatra'
require 'sinatra/namespace'
require 'sequel'
require 'json'
require 'require_all'

DB = Sequel.connect(ENV['DB_CONNECTION'])
require_all 'lib'

set :public_folder, File.expand_path('dist', File.dirname(__FILE__))

get '/' do
  send_file File.join(settings.public_folder, '/index.html')
end

register Sinatra::Namespace

namespace '/api' do
  get '/hello' do
    'Hello World'
  end

  get '/roles' do
    Role.new.all_roles
  end
end
