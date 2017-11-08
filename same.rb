#画像の色情報を定義する
#二次元配列　[image番号][R,G,B]
image = Array.new(5).map{Array.new(3)}
image = [[0.2, 0.5, 0.5], [0.3, 0.4, 0.7], [0.8, 0.5, 0.7], [0.5, 0.5, 0.5], [0.1, 0.7, 0.4]]

p image

#類似度を計算する, ans配列に答を格納していく
ans = Array.new(5)
for i in 0..4
  temp = image[i][j] 
  ans[i] = temp
end

p ans

#類似度が高いものからソートする



#出力する

