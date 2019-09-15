Fabricator(:category) do
  title { Faker::Name.name[5...19] }
  description { Faker::Name.name[5...19] }
  eng_title { Faker::Name.name[5...19] }
  icon 'local_offer'
end
