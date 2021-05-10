# # create 5 projects and link 3 new users and 5 new bugs to each
# 5.times do  
#   prog = Program.create(name: Faker::Company.name, status: Faker::Lorem.words, description: Faker::Lorem.paragraph(2), opened_date: Faker::Date.backward)
#   users = []
#   3.times {users << User.create(name: Faker::Name.name, email: Faker::Internet.email, role: "dev", password: Faker::Internet.password(8))}
  
#   bugs = []
#   5.times {bugs << Bug.create(category: Faker::Lorem.word, priority: Faker::Lorem.word, status: Faker::Lorem.word, overview: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, created: Faker::Date.backward, notes: Faker::Lorem.paragraph(1), next_steps: Faker::Lorem.paragraph(1), update_for_client: Faker::Lorem.sentence(1) )}
  
#   prog.users << users  
#   prog.bugs << bugs
# end
# 
# 10.times do
#   User.create(name: Faker::Name.name, email: Faker::Internet.email, role: "Project Manager", password: Faker::Internet.password(8))
# end
