# アプリ名
Amigo

# 概要
「Amigo」の語源は「友だち」。  
これは、人生ゲームとチャットを通して心豊かな生き方を見つけられるアプリです。  
#### Topページ
[![Image from Gyazo](https://i.gyazo.com/aa0442a913d1e82bd93de1bb6f1b6994.png)](https://gyazo.com/aa0442a913d1e82bd93de1bb6f1b6994)
#### 人生ゲーム（現在ゲーム開発中）
[![Image from Gyazo](https://i.gyazo.com/db6dda469751d7a6ac54f7992546ced4.jpg)](https://gyazo.com/db6dda469751d7a6ac54f7992546ced4)
#### メインチャットページ
[![Image from Gyazo](https://i.gyazo.com/ff5c8a60d6177dadc041997755da0524.png)](https://gyazo.com/ff5c8a60d6177dadc041997755da0524)
#### ルームチャット一覧ページ
[![Image from Gyazo](https://i.gyazo.com/e2b2b206c48e3f1c01e66c0549c73d91.png)](https://gyazo.com/e2b2b206c48e3f1c01e66c0549c73d91)
#### ルームチャットページ
[![Image from Gyazo](https://i.gyazo.com/21b35f501f7e43f457beb8df21260068.png)](https://gyazo.com/21b35f501f7e43f457beb8df21260068)
#### マイページ
[![Image from Gyazo](https://i.gyazo.com/618e5a3ce89ace211b3bd6939da1f27e.png)](https://gyazo.com/618e5a3ce89ace211b3bd6939da1f27e)

# 本番環境
http://54.150.238.148/

ログイン情報（テスト用）
- Eメール：usagi@gmail.com
- パスワード：usagi1

# 制作背景（意図）
私は、人々が幸せな生き方を見つけられる手段を作りたかった ー。その理由を以下にお話しします。
  
人類がこれまで培ってきた知識や技術が、経済や物質という形に表れていると仮定するとき、現代社会は物質的に飽和状態にあると言えるだろう。
そんな中、2000年代に入り循環型社会の形成を推進する「サーキュラーエコノミー」や、2010年代に「シェアリングエコノミー」がアベノミクスで始まったことは、
現代社会のあり方に疑問を抱く人々が増えてきていることの表れではないだろうか。
昨年にはコロナショックも起こったことで、今まで当たり前にあった物質的豊かさが当たり前ではなくなり、豊かさの定義を見つめ直す局面へ全世界が辿り着いているように思うのだ。
そこで今「Amigo」というキーワードを作ることで、豊かさとは何かを見つけるきっかけを作ることができるのではと思い制作を始めた。

# 工夫したポイント
工夫したポイントは、「Amigo」に熱中できる仕組みを作ったことです。  
具体的には  
- 人生ゲームの通貨を「アミーゴ」と名づけ、「アミーゴ」を獲得するためにチャットをし、獲得したアミーゴでまた人生ゲームを楽しめるという無限サイクルを作ったこと。  
[![Image from Gyazo](https://i.gyazo.com/3c3ca4daaf86d8e856c20741d06f6e65.gif)](https://gyazo.com/3c3ca4daaf86d8e856c20741d06f6e65)
- チャット文のフォントをドット文字にすることで、ゲームの中にいるような感覚を再現したこと。  
[![Image from Gyazo](https://i.gyazo.com/a231a84968fd15ebd2fc328a332d91ba.gif)](https://gyazo.com/a231a84968fd15ebd2fc328a332d91ba)
- ActionCableでメインチャット機能を実装することで、非同期通信を可能にし、やりとりのスムーズなチャットを作ったこと。  
[![Image from Gyazo](https://i.gyazo.com/4595612cbc8fccfff194720ae0ebc797.gif)](https://gyazo.com/4595612cbc8fccfff194720ae0ebc797)

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
