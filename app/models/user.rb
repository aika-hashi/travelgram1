class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :hotel_tweets
         has_many :trip_tweets
         has_many :hotel_tweet_comments
         has_many :trip_tweet_comments

         has_many :hotel_tweets, dependent: :destroy
         has_many :hotel_bookmarks, dependent: :destroy
         has_many :bookmark_hotel_tweets, through: :hotel_bookmarks, source: :hotel_tweet

         has_many :trip_tweets, dependent: :destroy
         has_many :trip_bookmarks, dependent: :destroy
         has_many :bookmark_trip_tweets, through: :trip_bookmarks, source: :trip_tweet

         has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
         has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
         has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
         has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  # ユーザーをフォローする、後ほどcontrollerで使用します。
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す、後ほどcontrollerで使用します。
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す、後ほどviewで使用します。
  def following?(user)
    following_user.include?(user)
  end

        
         validates :nickname,:email,:password,:password_confirmation,:firstname, :familyname, :firstname_kana, :familyname_kana, :date,presence: true

         with_options presence: true do
          validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
          validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
          validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
          validates :familyname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
        end


 end
