FactoryGirl.define do

  sequence :title do |n|
    Faker::Book.title + n.to_s
  end

  factory :article do |f|
    f.title
    f.description { Faker::Twitter.text }
    f.expired_at { Time.now.to_i + 86400 }
    f.created_at { Time.now.to_i }
    f.updated_at { Time.now.to_i }
  end

  trait :old_article do
    expired_at { Time.now.to_i - 1 }
  end

end
