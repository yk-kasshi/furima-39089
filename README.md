# テーブル設計


## usersテーブル
| Column                         | Type   | Options                  |
| ------------------------------ | ------ | ------------------------ |
| nick_name                      | string | null: false              |
| email                          | string | null: false unique: true |
| encrypted_password             | string | null: false              |
| last_name                      | string | null: true               |
| first_name                     | string | null: true               |
| last_name_kana                 | string | null: true               |
| first_name_kana                | string | null: true               |
| birth_day                      | date   | null: true               |

### Association
- has_many :products
- belongs_to :card


## cardsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |

### Association
- belongs_to :user


## destinationsテーブル
| Column        | Type    | Options     |
| ------------- | ------- | ------------|
| post_code     | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: true  |

### Association
- has_many :user


## productsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |
| user             | references | null: false, foreign_key: true  |
| price            | string     | null: false                     |
| description      | text       | null: false                     |
| condition_id     | integer    | null: false                     |
| shopping_day_id  | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| category_id      | integer    | null: false                     |
| shopping_id      | integer    | null: false                     |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images
- belongs_to_active_hash :prefecture

