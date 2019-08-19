# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  login                  :string
#  email                  :string
#  name                   :string
#  last_name              :string
#  token                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  sequence :email do |n|
    "john#{n}@doe.test"
  end
end

FactoryGirl.define do
  sequence :token do |n|
    SecureRandom.urlsafe_base64(40, false)
  end
end

FactoryGirl.define do
  sequence :valid_password do
    "fiku123Miku"
  end
end

FactoryGirl.define do
  sequence :valid_passwords do
    %w[haslo123 12345$67A test1@234]
  end
end

FactoryGirl.define do
  sequence :invalid_passwords do
    ["specia l5@b", "characters", "12345678"]
  end
end

FactoryGirl.define do
  factory :user do |n|
    email { generate(:email) }
    password { generate(:valid_password) }
    name "MyString"
    last_name "MyString"
    login "MyString"
    # installation Installation.create
    authentication_token { generate(:token) }

  end
end
