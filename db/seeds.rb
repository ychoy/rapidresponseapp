# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create({
  first_name: 'Maribel',
  last_name: 'Cervantes',
  email: 'maribel@me.com',
  password: '123456',
  helping: true,
  title: 'Family Immigration Laywer'
})

User.create({
  first_name: 'Juanito',
  email: 'juanito@me.com',
  password: '123456',
  helping: false,
})

User.create({
  first_name: 'Fatima',
  email:'fatima@me.com',
  password:' 123456',
  helping: false,
})

User.create({
  first_name: 'Zakir',
  last_name: 'Hussain',
  email: 'zakir@me.com',
  password: '123456',
  helping: true,
  title: 'Humanitarian Lawyer'
})
