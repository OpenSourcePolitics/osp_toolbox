# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

user = User.create!(
  email: "hello@example.org",
  password: "password",
  password_confirmation: "password"
)

document = Document.create!(
  user: user,
  title: Faker::Book.title
)

proposals_file = InputFile.new(typename: "Proposals", document: document)
proposals_file.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "proposals.csv")), filename: "proposals.csv")
proposals_file.save!

comments_file = InputFile.create(typename: "Comments", document: document)
comments_file.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "comments.csv")), filename: "comments.csv")
comments_file.save!

preprocessing = Processing.new(
  title: Faker::Book.title,
  client: Faker::Twitter.name,
  url: Faker::Internet.domain_name,
  sent_to_preprocessing_at: Time.now,
)
preprocessing.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "subset_raw_data.csv")), filename: "subset_raw_data.csv")
preprocessing.preprocessed_file_data.attach(io: File.open(Rails.root.join("db", "seeds_data", "subset_raw_data.json")), filename: "subset_raw_data.json")
preprocessing.save!
