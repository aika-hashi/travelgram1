FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familyname            {"山田"}
    firstname             {"陸太郎"}
    familyname_kana       {"ヤマダ"}
    firstname_kana        {"リクタロウ"}
    date                  {"1992-04-24"}

  end
end