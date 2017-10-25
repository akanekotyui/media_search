#ActiveRecordのモデルを作成する
#Imageモデルとimagesテーブルを作成

ActiveRecord::Base.establish_connection('sqlite3:///models.db') #image.db

class Image < ActiveRecord::Base
end
