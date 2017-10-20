#アプリケーションを管理するプログラム

require 'sinatra'
require 'sinatra/reloader' #編集しても再起動せずにアプリが動く
require 'SQLite3'
require 'active_record'

set :database, adapter: "sqlite3", database: "images.sqlite3"

get '/' do
#{}"hello world"
erb :index #ルートにアクセスしたらindex.erbを呼び出す
end

post '/search.erb' do
  @keyword = params[:KEYWORD]
  images = Image.all
  erb :search
end
