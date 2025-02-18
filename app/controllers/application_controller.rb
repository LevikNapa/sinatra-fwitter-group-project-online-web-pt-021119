require './config/environment'
require 'sinatra/base'


class ApplicationController < Sinatra::Base
  enable :sessions
  configure do
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    end

    def is_logged_in?
      !!current_user
    end
  end
end
