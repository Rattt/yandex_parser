# frozen_string_literal: true

FactoryGirl.define do
  sequence :title do |n|
    Faker::Book.title + n.to_s
  end

  factory :article do |f|
    f.title
    f.description { Faker::VForVendetta.speech }
    f.expired_at { Time.at(Time.now.to_i + 86400) }
    f.created_at { Time.now }
    f.updated_at { Time.now }
  end
end
