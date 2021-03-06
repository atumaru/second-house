### Second Houseとは
---------------------------------------------------------------------------------------------------
転勤や結婚を機に他の都道府県に引越しをされた方向けのコミュニティアプリです。  自分が福岡に転勤した際にこういったアプリがあったら良かったなという思いで作りました。



[![Image from Gyazo](https://i.gyazo.com/b6e0ce4b8603b64f0765f4d547721aa3.png)](https://gyazo.com/b6e0ce4b8603b64f0765f4d547721aa3)


### 機能一覧
--------------------------------------------------------------------------------------------------
#### チャット機能
[![Image from Gyazo](https://i.gyazo.com/c63b1a08125e9268f51107dc0e000608.gif)](https://gyazo.com/c63b1a08125e9268f51107dc0e000608)
・同じ都道府県の人同士でのチャット機能
・非同期通信(Action Cable使用)

#### カレンダー機能
[![Image from Gyazo](https://i.gyazo.com/c82d5ce0b93628eb291f78d591f955d3.gif)](https://gyazo.com/c82d5ce0b93628eb291f78d591f955d3)
・カレンダー機能を使用して同じ都道府県内でイベント作成


#### イイね機能
[![Image from Gyazo](https://i.gyazo.com/41615f0ce8654b7fbeb37ff11461ce10.gif)](https://gyazo.com/41615f0ce8654b7fbeb37ff11461ce10)
・イベントに対してイイね機能(非同期)

#### 画像投稿機能
[![Image from Gyazo](https://i.gyazo.com/f46411520ffcecc0b80ba04f755fe8ae.gif)](https://gyazo.com/f46411520ffcecc0b80ba04f755fe8ae)


#### コメント機能
[![Image from Gyazo](https://i.gyazo.com/246f96233c1757d569d86ce371e07b1e.gif)](https://gyazo.com/246f96233c1757d569d86ce371e07b1e)


#### 検索機能
[![Image from Gyazo](https://i.gyazo.com/aa06b681f993b530a378b9ccacad403f.gif)](https://gyazo.com/aa06b681f993b530a378b9ccacad403f)
・複数条件での検索(ransack使用)


#### その他
画像投稿機能・カレンダー機能についてログイン済み投稿者のみ編集・削除機能投稿機能

--------------------------------------------------------------------------------------------------

### 環境・使用技術
--------------------------------------------------------------------------------------------------

#### フロントエンド
・css ・JavaScript ・jQuery

#### バックエンド
.ruby2.6.5 ・rails6.0.0

#### DB
.MySql

#### 本番環境
・heroku

#### その他
・Rspecを導入しテスト記述( 単体 )
・Rubocopを導入しリンター機能の活用

--------------------------------------------------------------------------------------------------- 


### ER図
---------------------------------------------------------------------------------------------------
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
