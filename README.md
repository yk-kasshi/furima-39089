# テーブル設計


## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| user_image         | string |             |
| introduction       | text   |             |
| family_name        | string | null: false |
| first_name         | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy


## destinationテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| family_name   | string  | null: false                    |
| first_name    | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |
| post_code     | string  | null: false                    |
| prefecture    | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  |                                |

### Association
- belongs_to :user


## categoryテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| ancestry | references |                                |

### Association
- has_many :products


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


## imagesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| product_id | integer    | null: false, foreign_key: true |

### Association
- bekongs_to :product


## brandテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | index: false                   |

### Association
- has_many :products
