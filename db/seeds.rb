# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'MenuPage.rb'
require 'MenuSection.rb'
require 'MenuItem.rb'
require 'MenuPrice.rb'

puts "DynamoDB Deletion"

mp = MenuPage.create_table
ms = MenuSection.create_table
mi = MenuItem.create_table
mpr = MenuPrice.create_table

MenuPage.all.each { |mp| mp.delete() }
MenuSection.all.each { |ms| ms.delete() }
MenuItem.all.each { |mi| mi.delete() }
MenuPrice.all.each { |mpr| mpr.delete() }
