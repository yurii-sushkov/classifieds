# frozen_string_literal: true

Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { Faker::Name.name }
  admin false
end
