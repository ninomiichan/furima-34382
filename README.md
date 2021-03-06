
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
| Column            | Type        | options                      |
|-------------------|-------------|------------------------------|
| nickname          | string      | null:false                   |
| itemtext
      | text        | null:false                   |
| price             | integer     | null:false                   |
| category_id       | integer     | null:false                   |
| condition_id      | integer     | null:false                   |
| postage_id        | integer     | null:false                   |
| prefecture_id     | integer     | null:false                   |
| shipping_day_id  | integer     | null:false                   |
| user              | references  | null:false,foreign_key:true  |


### Association
- has_many :comments
- belongs_to :user
- has_one :order


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
| order          | references | null:false,foreign_key:true   |


### Association
- belongs_to :order





## commentsテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| comment  | text        | null:false                   |
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |


### Association
- has_many :users
- has_many :items
