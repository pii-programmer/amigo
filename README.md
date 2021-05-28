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
- has_many :rooms, through: user_rooms
- has_many :images


## user_roomsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| user_id  | references | foreign_key: true    |
| room_id  | references | foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :room


## roomsテーブル

|  Column  |  Type      | Options             |
| -------- | ---------- | ------------------- |
| title    | string     | null: false         |
| category | string     | null: false         |
| content  | text       | null: false         |
| user     | references | foreign_key: true   |
| chat     | references | foreign_key: true   |

### Association
- has_many :user_rooms
- has_many :users, through:user_rooms
- belongs_to :chat


## chatsテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| content  | text       | null: false          |
| user     | references | foreign_key: true    |
| room     | references | foreign_key: true    |

### Association
- has_many :rooms
- has_many :users


## imagesテーブル
|  Column  |  Type      | Options              |
| -------- | ---------- | -------------------- |
| picture  | string     | null: false          |
| user     | references | foreign_key: true    |

### Association
- belongs_to :user