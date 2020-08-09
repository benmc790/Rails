# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'First Category Name')
Category.create(name: 'Second Category Name')
Category.create(name: 'Third Category Name')
Category.create(name: 'Fourth Category Name')

Post.create(title: 'Post Title', content: 'Post Content...')
Post.create(title: 'Post Title 2', content: 'Post Content 2...')

CategoryPost.create(category_id: 1, post_id: 1)
CategoryPost.create(category_id: 2, post_id: 1)
