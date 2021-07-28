users = []
10.times do |i|
  users << User.new(level: i+1)
end
User.import users

levels = []
100.times do |l|
  level =+ l+1
  levels << Level.new(level: l+1)
end
Level.import levels