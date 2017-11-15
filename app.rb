#アプリケーションを管理するプログラム

require 'sinatra'
require 'sinatra/reloader' #編集しても再起動せずにアプリが動く
require 'SQLite3'
require 'sinatra/activerecord'


set :database, adapter: "sqlite3", database: "images.sqlite3"
require './models/image.rb'

get '/' do
    images = Image.all
erb :index,  locals:{images: images} #ルートにアクセスしたらindex.erbを呼び出す
end

get '/same' do
  #@std = parames[:STD]
  erb :same
end

post '/search.erb' do
 @keyword = params[:KEYWORD]
# images = Image.all
   results = Image.where("(title like ?) or (author like ?) or (url like ?) ", "%"+@keyword+"%", "%"+@keyword+"%", "%"+@keyword+"%")
  erb :search, locals:{results: results}
end

post '/new' do
  image = Image.new
  image.title = params[:title]
  image.author = params[:author]
  image.url = params[:url]
  image.save
  redirect '/'
end

post '/same.erb' do
  @std = params[:STD]
  erb :same
end
