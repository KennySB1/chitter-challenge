require 'sinatra/base'
require 'sinatra/reloader'
require './lib/Chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    @peeps = Chitter.peeps
    erb :index
  end




  run! if app_file == $0
end
