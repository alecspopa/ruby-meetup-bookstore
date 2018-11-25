# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create([
  { title: 'A Game of Thrones', author: 'George R. R. Martin', no_pages: 694 },
  { title: 'A Clash of Kings', author: 'George R. R. Martin', no_pages: 768 },
  { title: 'A Storm of Swords', author: 'George R. R. Martin', no_pages: 973 },
  { title: 'A Feast for Crows', author: 'George R. R. Martin', no_pages: 753 },
  { title: 'A Dance with Dragons', author: 'George R. R. Martin', no_pages: 1056 },
])
