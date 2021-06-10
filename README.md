# アプリ名
Amigo

# 概要
「amigo」とはラテン語で「友だち」の意味。このアプリを利用することで、ユーザーは日常的に「amigo」を体験できる。

このアプリでは、ユーザーは人生シミュレーションゲームの主人公となり、人生ゲームの様々なイベントにおいて必要となる「アミーゴ」を獲得する。「アミーゴ」の獲得方法はチャットに参加することである。
「アミーゴ」は現実世界の貨幣の役割も果たすが、語源である「友だち」や、「愛」「感謝」などの意味を持つため、アミーゴを集めることはユーザーの心の豊かさにもつながる。
アミーゴの意味に当てはまる発言や行動には+1、意味に反したものは-1アミーゴとなり、アミーゴを獲得した分だけ人生ゲームを大いに楽しめる仕様となっている。

# 本番環境
https://amigo-35568.herokuapp.com/

ログイン情報（テスト用）
- Eメール：usagi@gmail.com
- パスワード：usagi1

# 制作背景（意図）
人類がこれまで培ってきた知識や技術が、経済や物質という形に表れていると仮定するとき、現代社会は物質的に飽和状態にあると言えるだろう。
そんな中、2000年代に入り循環型社会の形成を推進する「サーキュラーエコノミー」や、2010年代に「シェアリングエコノミー」がアベノミクスで始まったことは、
現代社会のあり方に疑問を抱く人々が増えてきていることの表れではないだろうか。
そこに昨年よりコロナショックが加わり、今まで当たり前にあった物質的豊かさが当たり前ではなくなったことで、豊かさの定義を見つめ直す局面へ全世界が辿り着いたように思う。
そこで今「amigo」というキーワードを作ることで、豊かさとは何かを見つけるきっかけを作ることができるのではと思い、webアプリケーション「Amigo」の制作を始めた。

# 工夫したポイント
本来は、ゲーム開発をした上でチャット機能を盛り込むことを理想としていたが、制作期間やアジャイル型開発を意識し、お試し版webアプリケーションを作るという方針をとった。
Ruby on Rails, JavaScriptを主要言語として非同期通信で実装し、Amigoリリース第一版としてシンプルで親しみやすい仕様を目指した。

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
JavaScript, JQuery, Ajax

## データベース
MySQL, SequelPro

## インフラ
Heroku

## Webサーバ（本番環境）
Heroku

## アプリケーションサーバ（本番環境）
Heroku

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
課題
1. メインチャットがカレントユーザーしか投稿できない仕様になっている
2. Herokuへデプロイしているため、一定時間で画像が消えてしまう
3. チャット内容とアミーゴ指標が連動していない
課題を踏まえ数日以内に実行する機能
1. ActionCableの実装
2. AWS(EC2)にてデプロイ
3. Chart.jsの応用

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