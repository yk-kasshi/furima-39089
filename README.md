# テーブル設計


## usersテーブル
| Column                         | Type   | Options                  |
| ------------------------------ | ------ | ------------------------ |
| nick_name                      | string | null: false              |
| email                          | string | null: false unique: true |
| encrypted_password             | string | null: false              |
| introduction                   | text   |                          |
| kanji_last_name                | string | null: true               |
| kanji_first_name               | string | null: true               |
| hiragana_last_name             | string | null: true               |
| hiragana_first_name            | string | null: true               |
| katakana_last_name             | string | null: true               |
| katakana_first_name            | string | null: true               |
| full_width_katakana_last_name  | string | null: true               |
| full_width_katakana_first_name | string | null: true               |
| birth_day                      | string | null: true               |

### Association
- has_many :products dependent: :destroy
- belongs_to :card dependent: :destroy


## destinationテーブル
| Column        | Type    | Options     |
| ------------- | ------- | ------------|
| post_code     | string  | null: false |
| prefecture_id | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: true  |

### Association
- has_many :user


## productテーブル
| Column         | Type    | Options                         |
| -------------- | ------- | ------------------------------- |
| name           | string  | null: false                     |
| user_id        | integer | null: false, foreign_key: true  |
| price          | string  | null: false                     |
| status         | string  | null: false                     |
| size           | string  | null: false                     |
| description    | string  | null: false                     |
| shopping_cost  | string  | null: false                     |
| shopping_days  | string  | null: false                     |
| prefecture_id  | string  | null: false                     |
| brand_id       | integer | null: false, foreign_key: true  |
| category_id    | integer | null: false, foreign_key: true  |
| shopping_id    | integer | null: false, foreign_key: true  |
| judgement      | string  |                                 |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture

