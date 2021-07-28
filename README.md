# アプリ名
Amigo

# 概要
「Amigo」の語源は「友だち」。  
人生ゲームとチャットを通して心豊かな生き方を見つけられるアプリです。  
#### Topページ
[![Image from Gyazo](https://i.gyazo.com/12d56ba77259c9d3198a5c5d7e6eca78.jpg)](https://gyazo.com/12d56ba77259c9d3198a5c5d7e6eca78)
#### 人生ゲーム（現在ゲーム開発中）
[![Image from Gyazo](https://i.gyazo.com/541a59a335f1bf0cc4981d75775124c0.jpg)](https://gyazo.com/541a59a335f1bf0cc4981d75775124c0)
#### メインチャットページ
[![Image from Gyazo](https://i.gyazo.com/9aa956283c53c9d0b15d933035b11e89.png)](https://gyazo.com/9aa956283c53c9d0b15d933035b11e89)
#### ルームチャット一覧ページ
[![Image from Gyazo](https://i.gyazo.com/273911d7cbddd729c1524bc53fd64adc.png)](https://gyazo.com/273911d7cbddd729c1524bc53fd64adc)
#### ルームチャットページ
[![Image from Gyazo](https://i.gyazo.com/396d79fabf54b9720e85c92d62a5e40a.png)](https://gyazo.com/396d79fabf54b9720e85c92d62a5e40a)
#### マイページ
[![Image from Gyazo](https://i.gyazo.com/16f196ba61245531e27b6eb72a18531f.jpg)](https://gyazo.com/16f196ba61245531e27b6eb72a18531f)

# 本番環境
http://54.150.238.148/

ログイン情報（テスト用）
- Eメール：usagi@gmail.com
- パスワード：usagi1

# 制作背景（意図）
人々が幸せな生き方を見つけられるプロダクトを作りたかった。  
これが制作理由です。以下に詳しくお話しさせていただきます。  
  
人類がこれまで培ってきた知識や技術が、経済や物質という形に表れていると仮定するとき、現代社会は物質的に飽和状態にあると言えるだろう。
そんな中、2000年代に入り循環型社会の形成を推進する「サーキュラーエコノミー」や、2010年代に「シェアリングエコノミー」がアベノミクスで始まったことは、
現代社会のあり方に疑問を抱く人々が増えてきていることの表れではないだろうか。
昨年にはコロナショックも起こったことで、今まで当たり前にあった物質的豊かさが当たり前ではなくなり、豊かさの定義を見つめ直す局面へ全世界が辿り着いているように思うのだ。
そこで今「Amigo」というキーワードを作ることで、豊かさとは何かを見つけるきっかけを作ることができるのではと思い制作を始めた。

# 工夫したポイント
工夫したポイントは、「Amigo」に熱中できる仕組みを作ったことです。  
具体的には  
- 人生ゲームの通貨を「アミーゴ」と名づけ、「アミーゴ」を獲得するためにチャットをし、獲得したアミーゴでまた人生ゲームを楽しめるという無限サイクルを作ったこと。  
[![Image from Gyazo](https://i.gyazo.com/88032e7110b662b6e4dfe1b516420574.gif)](https://gyazo.com/88032e7110b662b6e4dfe1b516420574)
- チャット文のフォントをドット文字にすることで、ゲームの中にいるような感覚を再現したこと。  
[![Image from Gyazo](https://i.gyazo.com/629cf4f26ba33128cc64caf9541971b2.gif)](https://gyazo.com/629cf4f26ba33128cc64caf9541971b2)
- ActionCableでメインチャット機能を実装することで、非同期通信を可能にし、やりとりのスムーズなチャットを作ったこと。  
[![Image from Gyazo](https://i.gyazo.com/46b7f6b3cd88fb8fe93ef702e9d028dc.gif)](https://gyazo.com/46b7f6b3cd88fb8fe93ef702e9d028dc)

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
課題は、獲得アミーゴ数が61からスタートしていることです。そのため現在、メッセージ内容を解析してアミーゴ指標を変動させることに挑戦しています。  
今後実装したい機能は、人生ゲームの開発です。現在は、C#及びUnityでゲームを制作中です。

# DB設計

## usersテーブル
|  Column            |  Type   | Options                      |
| ------------------ | ------- | ---------------------------- |
| nickname           | string  | null: false                  |
| email              | string  | null: false,  unique: true   |
| encrypted_password | string  | null: false                  |

### Association
- has_many :chats
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- belongs_to :level



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
- belongs_to :user



## levelsテーブル
|  Column  |  Type      | Options                           |
| -------- | ---------- | --------------------------------- |
| level    | integer    | null: false                       |
