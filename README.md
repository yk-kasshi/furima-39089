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
| product     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :destination


## destinationsテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| id            | integer | null: false, primary_key: true |
| post_code     | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: true                     |

### Association
- has_many :orders


## productsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| user             | references | null: false, foreign_key: true  |
| item             | references | null: false, foreign_key: true  |
| destination      | references | null: false, foreign_key: true  |
| name             | string     | null: false                     |
| price            | integer    | null: false                     |
| description      | text       | null: false                     |
| condition_id     | integer    | null: false                     |
| shopping_day_id  | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| category_id      | integer    | null: false                     |
| shopping_id      | integer    | null: false                     |

### Association
- belongs_to :user
- belongs_to :destination
- has_many :cards

