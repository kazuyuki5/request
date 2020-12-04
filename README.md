## users テーブル

| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |

### Association

- has_many :chefs
- has_many  :requests

## chefs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| nickname        | string     | null: false                    |
| profile         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| area            | string     | null: false                    |
| fee_time_id     | integer    | null: false                    | 
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_one    :request

## requests テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| chef                | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :chef
 - has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| request       | references | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |


### Association

- belongs_to request