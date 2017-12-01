FactoryGirl.define do

  sequence :title do |n|
    Faker::Book.title + n.to_s
  end

  factory :article do |f|
    f.title
    f.description { Faker::VForVendetta.speech }
    f.expired_at { DateTime.strptime((Time.now.to_i + 86400).to_s,'%s') }
    f.created_at { DateTime.now }
    f.updated_at { DateTime.now }
  end

  trait :old_article do
    expired_at { DateTime.strptime((Time.now.to_i - 10).to_s,'%s') }
  end

end
