# アプリ名
Amigo

# 概要
「amigo」とはラテン語で「友だち」の意味。このアプリを利用することで、ユーザーは日常的に「amigo」を体験できる。

主な機能としては、人生シミュレーションゲームとチャットの2つがあり、ユーザーが人生シミュレーションゲーム実行時に、チャットへの参加を提案する。
例えば、人生シミュレーションゲーム内で買い物をする際に必要となるコインを、このアプリでは「アミーゴ」と名付けており、その「アミーゴ」を獲得するためにユーザーはチャットを行う。
チャットの発言内容によってアミーゴの獲得数は変わり、ポジティブ発言には+1、ネガティブ発言には-1アミーゴ獲得できる。
この獲得したアミーゴで人生シミュレーションゲームをより楽しく進めることができる。

# 本番環境
https:/

ログイン情報（テスト用）
- Eメール：
- パスワード：

# 制作背景（意図）
！途中！
とは、なぜから

# 工夫したポイント
工夫したポイントは、開発方針と言語選択の2つである。
本来は、ゲーム開発をした上でチャット機能を盛り込むことを理想としていたが、
制作期間や現在の実力を考慮し、お試し版webアプリケーションを作るという方針をとった。
現在の実力でwebアプリケーションを作るために適している言語はRubyであり、
チャット機能にはJavaScript, JQueryを使用してAjaxで実装することが適していると判断した。
今回のwebアプリケーション制作を通して得られた、フロントエンド, バックエンド, サーバの知識、
企画から開発までのアプリ開発フロー、およびエラー等の問題を解決する思考力を、今後の開発に活かしていきたい。

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
！途中！
- チャット機能
- アバター
- ゲーム
- スマホアプリの開発
Java C言語
誰もが日常でamigoを体験してもらうためには、スマホアプリ版の制作は欠かせない。


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