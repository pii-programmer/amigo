# テーブル設計

## usersテーブル
|  Column            |  Type  | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |

### Association
- has_many :user_rooms
- has_many :rooms, through: :user_rooms
- belongs_to :chat


## roomsテーブル
|  Column      |  Type      | Options             |
| ------------ | ---------- | ------------------- |
| title        | string     | null: false         |
| content      | text       | null: false         |
| user         | references | foreign_key: true   |

### Association
- has_many :user_rooms
- has_many :users, through: :user_rooms



## user_roomsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| user     | references | foreign_key: true    |
| room     | references | foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :room




## chatsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| content  | text       | null: false          |
| user     | references | foreign_key: true    |

### Association
- has_many :users