FactoryBot.define do
  factory :admin, class: User do
    username "katy"
    password "reallygoodpassword2"
    role 1
  end
end
