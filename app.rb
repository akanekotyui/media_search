#アプリケーションを管理するプログラム

require 'sinatra'
require 'sinatra/reloader' #編集しても再起動せずにアプリが動く
require 'SQLite3'
require 'sinatra/activerecord'
require 'rmagick'

set :database, adapter: "sqlite3", database: "images_sqlite3"
require './models/image.rb'



get '/' do
    images = Image.all
erb :index,  locals:{images: images} #ルートにアクセスしたらindex.erbを呼び出す
end

get '/same' do
  #@std = parames[:STD]
  erb :same
end

get '/ppm' do
  erb :ppm
end

get '/yurukyara' do
  erb :yurukyara
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
  @std = params[:STD].to_i
  images = Image.all
  erb :same, locals:{images: images}
end

post '/ppm.erb' do
  @ppm = params[:PPM]
  images = Image.all
  scr = Magick::ImageList.new(@ppm)
  erb :ppm, locals:{images: images, scr: scr}
end

post '/yurukyara.erb' do
  @yurukyara = params[:YURUKYARA]
  yurukyaras = Yurukyara.all
  scr = Magick::ImageList.new(@yurukyara)
  erb :yurukyara, locals:{yurukyaras: yurukyaras, scr: scr}
end
