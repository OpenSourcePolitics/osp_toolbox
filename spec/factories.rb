# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :user do
    password = Faker::Lorem.unique
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end

  factory :processing do
    user { create(:user) }
    title { Faker::Book.title }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/subset_raw_data.csv"), "text/csv")
    end

    trait :with_preprocessed_file_data do
      sent_to_preprocessing_at { Time.current }
      preprocessed_file_data do
        Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/subset_raw_data.json"))
      end
    end
  end

  factory :notification do
    event_name { "dummy" }
    resource_class { "dummy" }
    resource_id { 1 }
    target_id { 2 }
  end

  factory :input_file do
    document { create(:document) }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/proposals.csv"), "text/csv")
    end
  end

  factory :document do
    user { create(:user) }
  end

  factory :archive do
    document { create(:document) }
  end

  factory :analysis do
    processing { create(:processing) }
    typename { "wordclouds" }

    trait :wordclouds do
      typename { "wordclouds" }
    end

    trait :ldb do
      typename { "ldb" }
    end
  end
end
