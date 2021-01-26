# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
c1 = Cat.create(birth_date:'2020/2/2', name:'lux',color:'WHITE',sex:'M')
c2 = Cat.create(birth_date:'2010/2/2', name:'goo',color:'WHITE',sex:'F')
c3 = Cat.create(birth_date:'2011/2/2', name:'lee',color:'WHITE',sex:'F')
c4 = Cat.create(birth_date:'2015/2/2', name:'mike',color:'WHITE',sex:'M')