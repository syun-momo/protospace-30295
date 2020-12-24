# README

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| profile   | text   | null: false |
| occupation| text   | null: false |
| position  | text   | null: false |

### Association

## prototypes テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch_copy | string     | null: false |
| concept    | text       | null: false |
| user       | references | null: false, foreign_key: true |

### Association

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |