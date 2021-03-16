
## usersテーブル
| Column            | Type        | Options                  |
|-------------------|-------------|--------------------------|
| name              | string      | null: false              |
| password          | string      | null: false              |
| email             | string      | null:false, unique:true  |
| first_name        | string      | null:false               |
| family_name       | string      | null:false               |
| first_name_kana   | string      | null:false               |
| family_name_kana  | string      | null:false               |
| birth_day         | date        | null:false               |


### Association
- has_many :items
- has_many :comments



## itemsテーブル
| Column         | Type        | options                     |
|----------------|-------------|-----------------------------|
| name           | string      | null:false                  |
| introduction   | text        | null:false                  |
| price          | integer     | null:false                  |
| category_id    | integer     | null:false                  |
| condition      | integer     | null:false,foreign_key:true |
| postage        | integer     | null:false,foreign_key:true |
| shipping_area  | integer     | null:false                  |
| shipping_days  | integer     | null:false,foreign_key:true |
| user           | references  | null:false,foreign_key:true |


### Association
- has_many :comments
- belongs_to :user


## ordersテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item


## addressesテーブル
| Column         | Type       | Options      |
|----------------|------------|--------------|
| post_code      | string     | null:false   |
| prefecture_id  | integer    | null:false   |
| city           | string     | null:false   |
| address        | string     | null:false   |
| building_name  | string     | null:false   |
| phone_number   | integer    | null:false   |


### Association
- belongs_to :user
- belongs_to :item
- belongs_to :orders





## commentsテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| comment  | text        | null:false                   |
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |


### Association
- belongs_to :user
- belongs_to :item
