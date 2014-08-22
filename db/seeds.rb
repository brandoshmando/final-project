
puts "Database Creation Initialized"
puts "Creating Allesia..."
Professor.create(first_name:"Alessia", last_name:"Bellisario", email:"alessia@example.com", password:"blah")
# puts "Creating Brandon..."
# Professor.create(first_name:"Brandon", last_name:"Craft", email:"brancraft@gmail.com", password:"blah")
# puts "Creating Professors..."
# 10.times do |i|
#   name = Faker::Name.name.split(' ')
#   prof = Professor.create(first_name: name[0], last_name: name[1], email: Faker::Internet.safe_email(name[0]), crypted_password:Faker::Internet.password(8))
# end
# puts
# puts
# puts "----- 10 profs created -----"
# puts
# puts "Creating Assistants..."

# 10.times do |i|
#   name = Faker::Name.name.split(' ')
#   asst = Assistant.create(first_name: name[0], last_name: name[1], email: Faker::Internet.safe_email(name[0]), crypted_password: Faker::Internet.password(8))
# end
# puts
# puts
# puts "----- 10 assistants created -----"
# puts
# puts "Creating Evals..."

# 10.times do |i|
#   Eval.create(title: Faker::Commerce.product_name, professor_id: rand(100))
# end
# puts
# puts
# puts "----- 100 evals created -----"
# puts
# puts "Creating Categories..."
# @counter = 1
# 30.times do |i|
#   if i % 3 == 0
#     @counter += 1
#   end
#   cat = Category.create
#   cat.title = Faker::Commerce.product_name
#   cat.max_score = rand(50).to_s
#   cat.eval_id = @counter
#   cat.save
# end
# puts
# puts
# puts "----- 30 categries created -----"
# puts
# puts "Creating Comments..."
# @counter = 1
# 60.times do |i|
#   if i % 2 == 0
#     @counter += 1
#   end

#   com = Comment.create
#   com.description = Faker::Lorem.paragraph(1)
#   com.category_id = @counter
#   com.save
# end
# puts
# puts
# puts "----- 60 comments created -----"
# puts
# puts "Creating Courses..."
# 10.times do |i|
#   Course.create(name: Faker::Company.bs, description:Faker::Lorem.paragraph(1), professor_id: i)
# end
# puts
# puts
# puts "----- 10 Courses created -----"
# puts
# puts "Creating Rosters..."
# @days = %w[Mon Tues Wed Thurs Fri]
# 10.times do |i|
#   ros = Roster.create
#   ros.section_name = "First Section"
#   ros.meet_time = rand(24)
#   ros.meet_day = @days[rand(4)]
#   ros.location = ["PLD 124", "OSH 206", "BUT 405", "HPER 125"][rand(3)]
#   ros.course_id = i
#   ros.save
# end
# puts
# puts
# puts "----- 100 Rosters created -----"
# puts
# puts "Creating Students..."
# @counter = 1
# 2000.times do |i|
#   if i % 20 == 0 && i != 0
#     puts "#{i} students created..."
#   end

#   if i % 20 == 0
#     @counter += 1
#   end
#   stud = Student.create
#   name = Faker::Name.name.split(' ')

#   stud.first_name = name[0]
#   stud.last_name = name[1]
#   stud.email = Faker::Internet.safe_email(name[0])
#   stud.uid = Faker::Number.number(6)
#   stud.roster_id = @counter
#   stud.save
# end
# puts
# puts
# puts "----- 200 students created -----"
# puts
# puts
# puts "Database Complete!"



