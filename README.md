# テーブル設計

## usersテーブル
|  Column            |  Type  | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |

### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :chats


## roomsテーブル
|  Column      |  Type      | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- has_many :room_users
- has_many :users, through: :room_users



## room_usersテーブル
|  Column  |  Type      | Options                           |
| -------- | ---------- | --------------------------------- |
| user     | references | null: false, foreign_key: true    |
| room     | references | null: false, foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :room




## chatsテーブル
|  Column  |  Type      | Options                           |
| -------- | ---------- | --------------------------------- |
| content  | text       | null: false                       |
| user     | references | null: false, foreign_key: true    |

### Association
- belongs_to :users