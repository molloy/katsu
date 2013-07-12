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

MenuPage.create_table
MenuSection.create_table
MenuItem.create_table
MenuPrice.create_table

i = 0
MenuPage.all.each do |mp|
	i += 1
	puts "count is: " + i.to_s
	puts "id is: " + mp.id
	mp.delete
end

MenuSection.all.each { |ms| ms.delete() }
MenuItem.all.each { |mi| mi.delete() }
MenuPrice.all.each { |mpr| mpr.delete() }

# mp = MenuPage.find('6b92e0c5-f759-4faf-aaf1-8a77d09d7345')
# puts "mp id is: " + mp.id
# puts "address count is: " + mp.address.count.to_s

page_happyhr = MenuPage.new(name: 'Happy Hour')
mp_id = page_happyhr.id
section_handroll = page_happyhr.menu_sections.create(name: 'Hand Rolls')
section_drinks   = page_happyhr.menu_sections.create(name: 'Drink Specials')
# page_happyhr.save

puts "total count is: " + MenuPage.count.to_s

mp = MenuPage.all.first
puts "address count is: " + mp.menu_sections.count.to_s

# @page_happyhr = MenuPage.first
# @page_happyhr.menu_sections = [@section_handroll]

# mpcount = MenuPage.find('id')
# puts mpcount

# @page_happyhr.menu_sections << @section_drinks
# page_happyhr.save()

page_lunch   = MenuPage.create(name: 'Lunch')
# page_dinner  = MenuPage.create(name: 'Dinner')
# page_sushi   = MenuPage.create(name: 'Sushi & Sashimi')

# section_handroll = MenuSection.create(name: 'Hand Rolls')
# section_drinks   = MenuSection.create(name: 'Drink Specials')
