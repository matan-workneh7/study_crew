FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { 'user' }
    academic_year { rand(1..4) }

    trait :assistant do
      role { 'assistant' }
    end

    trait :regular_user do
      role { 'user' }
    end

    trait :with_long_password do
      password { 'verylongpassword123' }
      password_confirmation { 'verylongpassword123' }
    end

    trait :with_specific_academic_year do
      academic_year { 3 }
    end
  end

  # Named factories for convenience
  factory :assistant, parent: :user do
    role { 'assistant' }
  end

  factory :regular_user, parent: :user do
    role { 'user' }
  end
end 