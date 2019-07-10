# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


wevy = User.find(18)

Entry.create(date_created: "2019-01-23", content: "Hey there!", user_id: wevy.id)

Entry.create(date_created: "2019-06-04", content: "//tI went to the mall to say hi to a few friends there. Upon arrival, one of them says to me, //n//t\"Steve, I think we should have a talk.\" //n//t//t-After pulling me aside they continue.//n//t \"I think we should throw this lady a surprise party. It would likely mean a//n//tlot to her.\"//n//t//t- I agreed.//n//tAfter a while we decide to head back.", user_id: wevy.id)

Entry.create(date_created: "2017-07-03", content: "//tYooooooo. What's good?", user_id: wevy.id)

Entry.create(date_created: "2017-07-07", content: "//tYo", user_id: wevy.id)

Entry.create(date_created: "2017-07-05", content: "//tYooooooo. What's good? Homey!", user_id: wevy.id)

Entry.create(date_created: "2017-09-08", content: "//tYoooooo", user_id: wevy.id)

Entry.create(date_created: "2017-08-02", content: "//tYup", user_id: wevy.id)

