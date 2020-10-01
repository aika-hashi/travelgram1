# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password1       | string | null: false |
| password2       | string | null: false |
| firstname       | string | null: false |
| firstname_kana  | string | null: false |
| familyname      | string | null: false |
| familyname_kana | string | null: false |
| date            | date   | null: false |

### Association

- has_many :twitters
- has_many :hotel_tweet_comments
- has_many :trip_tweet_comments
- has_many :hotel_bookmarks
- has_many :hotel_bookmarks
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
- has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
- has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
- has_one_attached :image



## twitters テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| hotel_tweet  | references | null: false, foreign_key: true |
| trip_tweet  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :hotel_tweets
- has_many :trip_tweets


## hotel_tweets テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| price          | string     | null: false                    |
| discount       | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| age_id         | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| day_id         | integer    | null: false                    |
| crowd_id       | integer    | null: false                    |
| agency_id      | integer    | null: false                    |
| title          | string     | null: false                    |
| hotel_text     | text       | null: false                    |
| spot_text      | text       | null: false                    |
| corona_measure | text       | null: false                    |
| local          | string     | null: false                    |

### Association

- belongs_to :twitter
- has_many :comments
- belongs_to_active_hash :crowd
- belongs_to_active_hash :area
- belongs_to_active_hash :day
- has_one_attached :image
- has_one :trip

## trip_tweets テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| price          | string     | null: false                    |
| discount       | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| area_id        | integer    | null: false                    |
| day_id         | integer    | null: false                    |
| crowd_id       | integer    | null: false                    |
| title          | string     | null: false                    |
| text           | text       | null: false                    |
| corona_measure | text       | null: false                    |
| traffic        | text       | null: false                    |
| fare           | string     | null: false                    |
| local          | string     | null: false                    |

### Association

- belongs_to :twitter
- has_many :comments
- belongs_to_active_hash :crowd
- belongs_to_active_hash :area
- belongs_to_active_hash :day
- belongs_to_active_hash :agency
- has_one_attached :image
- belongs_to :tweet






## hotel_tweet_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| hotel_tweet    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet_comments


## trip_tweet_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| trip_tweet     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :trip_comments




## hotel_bookmarks テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| hotel_tweet  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet_comments


## trip_bookmarks テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| trip_tweet  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :trip_comments




## hotel_relationships テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| follower   | references | null: false, foreign_key: true |
| followed  | references | null: false, foreign_key: true |

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"


## trip_relationships テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| follower   | references | null: false, foreign_key: true |
| followed  | references | null: false, foreign_key: true |

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"