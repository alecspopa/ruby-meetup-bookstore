# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:title, 'A') { |n| "Book #{n}" }
    sequence(:author, 'A') { |n| "Author #{n}" }
    no_pages { 101 }
  end
end
