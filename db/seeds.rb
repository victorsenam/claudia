user = User.create!(email: "root@root.com", name: "root", password: "roottoor")
user.rank= User::SUPER
user.save!