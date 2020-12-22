# テーブル設計

## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| employee_number | integer | null: false |
| division_id     | integer | null: false |
| position_id     | integer | null: false |
| password        | string  | null: false |
| goal_count      | integer |             |
| email           | string  |             |

### Association
- has_many :goals

## goals テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| deadline         | date       | null: false                    |
| progress         | integer    |                                |
| done             | boolean    | default: false, null: false    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to : user
