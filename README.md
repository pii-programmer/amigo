# テーブル設計

## usersテーブル

|  Column  |  Type  | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many contents
- has_many comments

## contentsテーブル
