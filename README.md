
## usersテーブル
| Column             | Type        | Options                  |
|--------------------|-------------|--------------------------|
| name               | string      | null: false              |
| encrypted_password | string      | null: false              |
| email              | string      | null:false, unique:true  |
| first_name         | string      | null:false               |
| family_name        | string      | null:false               |
| first_name_kana    | string      | null:false               |
| family_name_kana   | string      | null:false               |
| birth_day          | date        | null:false               |


### Association
- has_many :items
- has_many :comments
- has_many :orders



## itemsテーブル
| Column            | Type        | options     |
|-------------------|-------------|-------------|
| name              | string      | null:false  |
| introduction      | text        | null:false  |
| price             | integer     | null:false  |
| category_id       | integer     | null:false  |
| condition_id      | integer     | null:false  |
| postage_id        | integer     | null:false  |
| shipping_area_id  | integer     | null:false  |
| shipping_days_id  | integer     | null:false  |
| user              | references  | null:false  |


### Association
- has_many :comments
- belongs_to :user
- has_one :orders


## ordersテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column         | Type       | Options                       |
|----------------|------------|-------------------------------|
| post_code      | string     | null:false                    |
| prefecture_id  | integer    | null:false                    |
| city           | string     | null:false                    |
| address        | string     | null:false                    |
| building_name  | string     |                               |
| phone_number   | string     | null:false                    |
| orders         | references | null:false,foreign_key:true   |


### Association
- belongs_to :orders





## commentsテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| comment  | text        | null:false                   |
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |


### Association
- has_many :user
- has_many :item
