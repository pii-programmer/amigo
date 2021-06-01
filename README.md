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
- has_many :messages
- has_many :chats


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
belongs_to :room
belongs_to :user



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