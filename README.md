
![image](https://user-images.githubusercontent.com/77035251/110192487-cc5d4180-7e71-11eb-8310-f38ac870bd8f.png)

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
-has_many :rooms,through: room_users
-has_many :events
-has_many :likes, dependent: :destroy
-has_many :like_events, through: :likes, source: :event
-belongs_to :prefecture  
-belongs_to :prefecture_now




### tweets テーブル

| Column          |  Type        | Options            |
|-----------------|--------------|--------------------|
| title           | string       | null: false        |
| text            | text         | null: false        |
| user            | references   | null: false        |
| prefecture_id   | references   | foreign_key: true  |


## Association
 -has_many :comments, dependent: :destroy
 -belongs_to :user
 -belongs_to :prefecture



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

| Column         |  Type    | Options             |
|----------------|----------|---------------------|
| name           | string   | null: false         |
| prefecture_id  | integer  | foreign_key: true   |

## Association

-has_many :messages
-has_many :users,through :room_users
-has_many :room_users


### events テーブル

| Column        |  Type        | Options             |
|---------------|--------------|---------------------|
| title         | string       | null: false         |
| text          | content      | null: false         |
| start_time    | datetime     | null:               |
| user          | references   | foreign_key :true   |
| prefecture_id | integer      |                     | 
| likes_count   | integer      |                     |

##  Association

 -belongs_to :user
 -belongs_to :prefecture
 -has_many :likes, dependent: :destroy
 -has_many :liking_users, through: :likes, source: :user

### messages テーブル

| Column   |  Type       | Options             |
|----------|-------------|---------------------|
| content  | text        | null: false         |
| user     | references  | foreign_key :true   |
| room     | references  | foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :room


### room_users テーブル

| Column   |  Type       | Options             |
|----------|-------------|---------------------|
| user     | references  | foreign_key :true   |
| room     | references  | foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :event


### likes テーブル

| Column   |  Type       | Options                         |
|----------|-------------|---------------------------------|
| user     | references  | null: false,foreign_key :true   |
| room     | references  | null: false,foreign_key :true   |


## Association

-belongs_to :user
-belongs_to :schedule
