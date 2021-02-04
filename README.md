### users テーブル

| Column                   |  Type    | Options                   |
|--------------------------|----------|---------------------------|
| nickname                 | string   | null: false               |
| email                    | string   | null: false, unique: true |
| encrypted_password       | string   | null: false               |
| last_name                | string   | null: false               |
| first_name               | string   | null: false               |
| prefecture_id            | integer  | null: false               |
| prefecture_now_id        | integer  | null: false               |

## Association

-has_many :tweets
-has_many :messages
-has_many :comments
-has_many :room_users
-has_many :schedule_users
-has_many :rooms,through: room_users
-has_many :schedules,through: schedule_users


### tweets テーブル

| Column          |  Type        | Options       |
|-----------------|--------------|---------------|
| title           | string       | null: false   |
| text            | text         | null: false   |
| user            | references   | null: false   |


## Association
 -has_many   :comments
 -belongs_to :user



### comments テーブル

| Column   |  Type        | Options                         |
|----------|--------------|---------------------------------|
| user     | references   | null: false,foreign_key :true   |
| tweet    | references   | null: false,foreign_key :true   |
| text     | text         | null: false                     |


## Association

-belongs_to :user
-belongs_to :tweet


### rooms テーブル

| Column  |  Type    | Options       |
|---------|----------|---------------|
| name    | string   | null: false   |

## Association

-has_many :messages
-has_many :schedules
-has_many :users,through :room_users
-has_many :room_users


### schedules テーブル

| Column   |  Type        | Options                          |
|----------|--------------|----------------------------------|
| plan     | text         | null:                            |
| date     | date         | null:                            |
| room     | references   | null: false,foreign_key :true    |
| user     | references   | null: false,foreign_key :true    |

##  Association

-has_many   :users,through :schedule_users
-has_many   :schedule_users
-belongs_to :room

### messages テーブル

| Column   |  Type       | Options                         |
|----------|-------------|---------------------------------|
| content  | text        | null: false                     |
| user     | references  | null: false,foreign_key :true   |
| room     | references  | null: false,foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :room


### room_users テーブル

| Column   |  Type       | Options                         |
|----------|-------------|---------------------------------|
| user     | references  | null: false,foreign_key :true   |
| room     | references  | null: false,foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :room


### schedule_users テーブル

| Column   |  Type       | Options                         |
|----------|-------------|---------------------------------|
| user     | references  | null: false,foreign_key :true   |
| room     | references  | null: false,foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :schedule
