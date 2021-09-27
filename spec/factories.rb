# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :user do
    password = Faker::Lorem.unique
    nickname { Faker::Twitter.screen_name }
    email { Faker::Internet.unique.email(domain: "example.org") }
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
      preprocessed_at { Time.current }
      preprocessed_file_data do
        Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/subset_raw_data.json"))
      end

      after(:create) do |processing|
        processing.available_categories = processing.parse_categories
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

    trait :with_comment_file do
      file do
        Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/comments.csv"), "text/csv")
      end
    end
  end

  factory :document do
    user { create(:user) }

    trait :with_archive do
      archive { create(:archive) }
    end
  end

  factory :archive do
    document { create(:document) }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/archive.zip"))
    end
  end

  factory :analysis do
    processing { create(:processing) }
    typename { "wordclouds" }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/wordclouds.png"))
    end

    trait :wordclouds do
      typename { "wordclouds" }
      file do
        Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/wordclouds.png"))
      end
    end

    trait :ldb do
      typename { "ldb" }
      file do
        Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/ldb.xlsx"))
      end
    end

    trait :without_file do
      file { nil }
    end
  end
end
