# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { 'test@factory.com' }
    password { 'aaabbb' }
    password_confirmation { 'aaabbb' }
    name { 'test user' }
    birthday { '2019/01/01' }
  end
end
