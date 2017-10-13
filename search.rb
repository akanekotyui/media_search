require 'sinatra'
require 'sinatra/reloader' #編集しても再起動せずにアプリが動く

get '/' do
#{}"hello world"
erb :index #ルートにアクセスしたらindex.erbを呼び出す
end

post '/search.cgi' do
  "Hello World"
end
