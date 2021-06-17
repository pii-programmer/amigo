# アプリ名
Amigo

# 概要
「amigo」とはラテン語で「友だち」の意味。このアプリを利用することで、ユーザーは日常的に「amigo」を体験することができる。

このアプリでは、ユーザーは人生シミュレーションゲームの主人公となり、人生ゲーム内で起こる様々なイベントを経験する。そこで必要となる「アミーゴ」を獲得するために、ユーザーはチャットに参加する。
「アミーゴ」は現実世界の貨幣の役割も果たすが、語源である「友だち」や、「愛」「感謝」などの意味を持つため、アミーゴを集めることはユーザーの心の豊かさにもつながる。
アミーゴの意味に当てはまる発言や行動には+1、意味に反したものは-1アミーゴとなり、アミーゴを獲得した分だけ人生ゲームを大いに楽しめる仕様になっている。

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
そこで今「amigo」というキーワードを作ることで、豊かさとは何かを見つけるきっかけを作ることができるのではと思い、webアプリケーション「Amigo」の制作を始めた。

# 工夫したポイント
工夫したポイントは、「Amigo」の世界へ自然と引き込まれていく仕組みを作ったことである。
3つの具体的なポイント
- ゲームを楽しむために「アミーゴ」を獲得し、その「アミーゴ」でゲームを楽しむという無限サイクルを作ったこと。
- チャット文のフォントをドット文字にすることで、ゲームの中にいるような感覚を再現したこと。
- ActionCableでメインチャット機能を実装することで、非同期通信が可能となりチャットのやりとりが楽しくなること。

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

# 課題や今後実装したい機能
3つの課題
- 現段階では、チャットの内容を判別してアミーゴ指標に反映させるということができなかった。（更新ボタンを押して指標が変わることを体験していただく設定にした）
- 人生ゲームを開発することができなかった。
- 日常的に「amigo」を体験していただくためには、webアプリケーションよりスマホアプリの方が適切であった。
上記3つの課題から今後実装したい機能
- リアルタイムチャットに適した言語で作り直し、そこにチャット内容を識別するアルゴリズムを導入する。
- 人生ゲームの開発。
- スマホアプリ用の言語で開発する。

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