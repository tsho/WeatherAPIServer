# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Prediction.create!(prefecture:  "Tokyo",
#             prediction: "Sunny",
#date: Time.zone.local(2015, 7, 22, 0, 0, 0))

Prefectures = [
  ["北海道", "Hokkaido", 1],
  ["青森", "Aomori", 2],
  ["岩手", "Iwate", 2],
  ["宮城", "Miyagi",2 ],
  ["秋田", "Akita", 2],
  ["山形", "Yamagata", 2],
  ["福島", "Fukushima", 2],
  ["東京", "Tokyo", 3],
  ["神奈川", "Kanagawa", 3],
  ["埼玉", "Saitama", 3],
  ["千葉", "Chiba", 3],
  ["茨城", "Ibaraki", 3],
  ["栃木", "Tochigi", 3],
  ["群馬", "Gunma", 3],
  ["山梨", "Yamanashi", 3],
  ["長野", "Nagano", 3],
  ["新潟", "Niigata", 4],
  ["富山", "Toyama", 4],
  ["石川", "Ishikawa", 4],
  ["福井", "Fukui", 4],
  ["愛知", "Aichi", 5],
  ["岐阜", "Gifu", 5],
  ["静岡", "Shizuoka", 5],
  ["三重", "Mie", 5],
  ["大阪", "Osaka", 6],
  ["兵庫", "Hyogo", 6],
  ["京都", "Kyoto", 6],
  ["滋賀", "Shiga", 6],
  ["奈良", "Nara", 6],
  ["和歌山", "Wakayama", 6],
  ["鳥取", "Tottori", 7],
  ["島根", "Shimane", 7],
  ["岡山", "Okayama", 7],
  ["広島", "Hiroshima", 7],
  ["山口", "Yamaguchi", 9],
  ["徳島", "Tokushima", 8],
  ["香川", "Kagawa", 8],
  ["愛媛", "Ehime", 8],
  ["高知", "Kochi", 8],
  ["福岡", "Fukuoka", 9],
  ["佐賀", "Saga", 9],
  ["長崎", "Nagasaki", 9],
  ["熊本", "Kumamoto", 9],
  ["大分", "Oita", 9],
  ["宮崎", "Miyazaki", 10],
  ["鹿児島", "Kagoshima", 10],
  ["沖縄", "Okinawa", 11]
]

Area = [
  [1, "北海道地方"],
  [2, "東北地方"],
  [3, "関東甲信地方"],
  [4, "東海地方"],
  [5, "北陸地方"],
  [6, "近畿地方"],
  [7, "中国地方"],
  [8, "四国地方"],
  [9, "九州北部地方"],
  [10, "九州南部地方"],
  [11, "沖縄地方"]
]

Prefectures.each do |pref|
  if pref[2] == 1 or  pref[1] == "Aomori"
    weather = "Rain"
  elsif pref[2] >= 2 and pref[2] < 7
    weather = "Clear"
  elsif pref[2] > 6 and pref[2] <= 10
    weather = "Rain"
  elsif pref[1] == "Okinawa"
    weather = "Clear"
  end

  p pref[1]

  Prediction.create!(prefecture:  pref[1],
                     prediction: weather,
                     date: Time.zone.local(2015, 7, 22, 0, 0, 0))

end
