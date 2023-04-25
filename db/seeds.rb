# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# しんちゃん作成
# 管理者側にはsign_upがないのでログイン時の初期値を設定
Admin.create!(
  email: "test@naganocake.com",
  password: "test1111"
)
