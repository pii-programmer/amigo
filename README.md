# テーブル設計

## usersテーブル
|  Column            |  Type  | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |

### Association
- belongs_to :chat
- has_many :user_rooms
- has_many :rooms, through: :user_rooms


## roomsテーブル
|  Column      |  Type      | Options             |
| ------------ | ---------- | ------------------- |
| content      | text       | null: false         |
| user         | references | foreign_key: true   |
| room_manager | references | foreign_key: true   |

### Association
- has_many :user_rooms
- has_many :users, through: :user_rooms
- belongs_to :room_manager



## user_roomsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| user     | references | foreign_key: true    |
| room     | references | foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :room



## room_managersテーブル
|  Column  |  Type      | Options             |
| -------- | ---------- | ------------------- |
| title    | string     | null: false         |

### Association
- has_one :room



## chatsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| content  | text       | null: false          |
| user     | references | foreign_key: true    |

### Association
- has_many :users