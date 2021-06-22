# アプリ名
Amigo

# 概要
「Amigo」の語源は「友だち」。  
人生ゲームとチャットを通して心豊かな生き方を見つけられるアプリ。

# 本番環境
http://54.150.238.148/

ログイン情報（テスト用）
- Eメール：usagi@gmail.com
- パスワード：usagi1

# 制作背景（意図）
人類がこれまで培ってきた知識や技術が、経済や物質という形に表れていると仮定するとき、現代社会は物質的に飽和状態にあると言えるだろう。
そんな中、2000年代に入り循環型社会の形成を推進する「サーキュラーエコノミー」や、2010年代に「シェアリングエコノミー」がアベノミクスで始まったことは、
現代社会のあり方に疑問を抱く人々が増えてきていることの表れではないだろうか。
昨年にはコロナショックも起こったことで、今まで当たり前にあった物質的豊かさが当たり前ではなくなり、豊かさの定義を見つめ直す局面へ全世界が辿り着いているように思うのだ。
そこで今「Amigo」というキーワードを作ることで、豊かさとは何かを見つけるきっかけを作ることができるのではと思い制作を始めた。

# 工夫したポイント
工夫したポイントは、「Amigo」に熱中できる仕組みを作ったことである。  
具体的には  
- 人生ゲームの通貨を「アミーゴ」と名づけ、「アミーゴ」を獲得するためにチャットをし、獲得したアミーゴでまた人生ゲームを楽しめるという無限サイクルを作ったこと。
- チャット文のフォントをドット文字にすることで、ゲームの中にいるような感覚を再現したこと。
- ActionCableでメインチャット機能を実装することで、非同期通信を可能にし、やりとりのスムーズなチャットを作ったこと。

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
JavaScript, JQuery, Ajax

## データベース
MySQL, SequelPro

## インフラ
AWS(EC2), Capistrano（開発環境）

## Webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題と今後実装したい機能
課題と今後実装したい機能は、「Amigo」の人生ゲーム部分の開発である。現在は、enchant.js及びUnityを用いてゲームのモックアップを作っている。

# DB設計

## usersテーブル
|  Column            |  Type  | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |

### Association
- has_many :chats
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


## roomsテーブル
|  Column      |  Type      | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages



## room_usersテーブル
|  Column  |  Type      | Options                           |
| -------- | ---------- | --------------------------------- |
| user     | references | null: false, foreign_key: true    |
| room     | references | null: false, foreign_key: true    |

### Association
- belongs_to :room
- belongs_to :user



## messagesテーブル
|  Column  |  Type      | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user



## chatsテーブル
|  Column  |  Type      | Options                           |
| -------- | ---------- | --------------------------------- |
| content  | text       | null: false                       |
| user     | references | null: false, foreign_key: true    |

### Association
- belongs_to :users
