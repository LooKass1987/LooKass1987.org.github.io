FactoryGirl.define do
  factory :user do
    email 'user@test.test'
    password '+1234567'
    password_confirmation  '+1234567'
  end
end
