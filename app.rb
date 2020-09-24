require 'sinatra/base'
require_relative './lib/diary'
require_relative './lib/entry'


class DiaryApp < Sinatra::Base
enable :sessions, :method_override

  get '/' do
    @pages = Diary.all

    erb(:index)

  end

  post '/entries/:title' do
    @entry = Diary.retrieve_entry(params[:title])
    erb(:entry)
  end

run! if app_file == $PROGRAM_NAME
end
