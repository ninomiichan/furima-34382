
## usersテーブル
| Column    | Type    | Options               |
|-----------|---------|-----------------------|
| name      | string  |null: false            |
| password  | string  |null: false            |
| email     | string  |null:false, unique:true|


### Association
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy


## profiles テーブル
| Column            | Type        | Options                      |
|-------------------|-------------|------------------------------|
| first_name        | string      | null:false                   |
| family_name       | string      | null:false                   |
| first_name_kana   | string      | null:false                   |
| family_name_kana  | string      | null:false                   |
| birth_day         | date        | null:false                   |
| introduction      | text        |                              |
| user              | references  | null:false,foreign_key:true  |


### Association
- belongs_to :user



## sending_destinationsテーブル
| Column                       | Type       | Options                                        |
|------------------------------|------------|------------------------------------------------|
| destination_first_name       | string     | null:false                                     |
| destination_family_name      | string     | null:false                                     |
| destination_first_name_kana  | string     | null: false unless value.to_s =~/^[^ -~｡-ﾟ]*$/ |
| destination_family_name_kana | string     | null: false unless value.to_s =~/^[^ -~｡-ﾟ]*$/ |
| destination_first_name_kana  | string     | null: false                                    |
| destination_family_name_kana | string     | null: false                                    |
| post_code                    | integer(7) | null:false                                     |
| prefecture_code              | integer    | null:false                                     |
| city                         | string     | null:false                                     |

@@ -119,8 +162,8 @@


## itemsテーブル
| Column           | Type        | options                                                   |
|------------------|-------------|-----------------------------------------------------------|
| name             | string      | null:false,validates :introduction,length:{maximum:40}    |
| introduction     | text        | null:false,validates :introduction,length:{maximum:1000}  |
| name             | string      | null:false                                                |
| introduction     | text        | null:false                                                |
| price            | integer     | null:false                                                |
| brand            | text        | null:false                                                |
| item_condition   | integer     | null:false,foreign_key:true                               |
| postage_payer    | integer     | null:false,foreign_key: true                              |
| prefecture_code  | integer     | null:false                                                |
| preparation_day  | integer     | null:false,foreign_key: true                              |
| category         | references  | null:false,foreign_key:true                               |
| trading_status   | integer     |                                                           |
| seller           | references  | null:false,foreign_key:true                               |
| buyer            | references  | foreign_key:true                                          |


### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :item_imgs, dependent: :destroy
- belongs_to :category
- belongs_to :user


## item_imgsテーブル
| Column  |Type         | Options                      |
|---------|-------------|------------------------------|
| url     |string       | null:false                   |
| item    | references  | null:false,foreign_key:true  |


### Association
- belongs_to :item


## commentsテーブル
| Column   | Type        | Options                      |
|----------|-------------|------------------------------|
| comment  | text        | null:false                   |
| user     | references  | null:false,foreign_key:true  |
| item     | references  | null:false,foreign_key:true  |


### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル
| Column    |Type     | Options     |
|-----------|---------|-------------|
| name      | string  | null:false  |
| ancestry  | string  | null:false  |


### Association
- has_many :items