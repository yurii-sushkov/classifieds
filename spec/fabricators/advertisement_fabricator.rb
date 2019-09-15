Fabricator(:advertisement) do
  title { Faker::Name.name[5...19] }
  text { Faker::Name.name[10...100] }
  category_id 1
  user_id 1
end
