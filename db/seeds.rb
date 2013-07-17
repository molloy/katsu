# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MenuPage.delete_all
MenuColumn.delete_all
MenuSection.delete_all
MenuItem.delete_all
MenuPrice.delete_all

happyhr = MenuPage.create(title: 'Happy Hour Menu', tab: 'Happy Hour', info: 'MONDAYS 5:30 - 8:30PM<br/>TUESDAY - SUNDAY 5:30 - 6:30PM')
lunch = MenuPage.create(title: 'Lunch Menu', tab: 'Lunch', info: 'TUESDAY - FRIDAY 11:30 - 2:00PM')
dinner = MenuPage.create(title: 'Dinner Menu', tab: 'Dinner', info: 'MONDAY - SUNDAY 5:30PM - 10:00PM')
sushi = MenuPage.create(title: 'Sushi &amp; Sashimi', tab: 'Sushi &amp; Sashimi')

happyhr_col1 = MenuColumn.create(span: 8, cols: 2, menu_page: happyhr)
happyhr_col2 = MenuColumn.create(span: 4, menu_page: happyhr)
handrolls = MenuSection.create(title: 'Hand Rolls', menu_column: happyhr_col1)
drink_specials = MenuSection.create(title: 'Drink Specials', menu_column: happyhr_col2)
MenuPrice.create(menu_item: MenuItem.create(title: 'California Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Philly Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Baked Salmon Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Vegetable Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Avocado Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Spicy Tuna Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Spicy Yellowtail Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Spicy Scallop Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Spicy Albacore Roll', menu_section: handrolls), price: '$2.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'w/ Soy Wrap Paper', menu_section: handrolls), price: '+$0.75')
menuitem = MenuItem.create(title: 'KIRIN DRAFT BEER', menu_section: drink_specials)
MenuPrice.create(menu_item: menuitem, title: 'GLASS', price: '$1.50')
MenuPrice.create(menu_item: menuitem, title: 'PITCHER', price: '7.50')
menuitem = MenuItem.create(title: 'HOT SAKE', menu_section: drink_specials)
MenuPrice.create(menu_item: menuitem, title: 'SMALL', price: '$2.00')
MenuPrice.create(menu_item: menuitem, title: 'LARGE', price: '$4.00')
MenuPrice.create(menu_item: MenuItem.create(title: 'HOUSE COLD SAKE', menu_section: handrolls), price: '$4.00')
MenuPrice.create(menu_item: MenuItem.create(title: 'NIGORI SAKE', menu_section: handrolls), price: '$4.00')
menuitem = MenuItem.create(title: 'HOUSE WINE', menu_section: drink_specials)
MenuPrice.create(menu_item: menuitem, title: 'RED', price: '$4.00')
MenuPrice.create(menu_item: menuitem, title: 'WHITE', price: '$4.00')
MenuPrice.create(menu_item: MenuItem.create(title: 'CHAMPAGNE (187ml)', menu_section: handrolls), price: '$4.00')
lunch_col01 = MenuColumn.create(span: 4, cols: 1, menu_page: lunch)
lunch_col02 = MenuColumn.create(span: 4, cols: 1, menu_page: lunch)
lunch_col03 = MenuColumn.create(span: 4, cols: 1, menu_page: lunch)
lunch_sect = MenuSection.create(title: 'Lunch Menu', info: '&amp;nbsp;', menu_column: lunch_col01)
lunchcombo = MenuSection.create(title: 'Lunch Combination', info: 'Served w/ miso soup, salad &amp; rice', menu_column: lunch_col02)
lunchdrinks = MenuSection.create(title: 'Lunch Drinks', info: '&amp;nbsp;', menu_column: lunch_col03)
lunchdess = MenuSection.create(title: 'Dessert', menu_column: lunch_col03)

# lunch menu
MenuPrice.create(menu_item: MenuItem.create(title: 'Chicken Curry Rice', info: 'Homemade chicken curry w/ egg', menu_section: lunch_sect), price: '$8.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Soba (hot or cold)', info: 'Japanese Buckwheat Noodles', menu_section: lunch_sect), price: '$5.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Cha-Soba', info: 'Japanese Green Tea Noodle', menu_section: lunch_sect), price: '$6.5')
menuitem = MenuItem.create(title: 'Tempura Soba', info: 'Japanese Buckwheat or Green Tea Noodle', menu_section: lunch_sect)
MenuPrice.create(menu_item: menuitem, title: 'hot', price: '$7.5')
MenuPrice.create(menu_item: menuitem, title: 'cold', price: '$8.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Tekka-Don', info: 'Fresh tuna sashimi on top of sushi rice w/ miso soup', menu_section: lunch_sect), price: '$10.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Mucho Tekka', info: 'Extra tuna sashimi on top of sushi rice w/ miso soup', menu_section: lunch_sect), price: '$13')
MenuPrice.create(menu_item: MenuItem.create(title: 'Chirashi', info: 'Assorted fresh sashimi on top of sushi rice w/ miso soup &amp; salad', menu_section: lunch_sect), price: '$13')
MenuPrice.create(menu_item: MenuItem.create(title: 'Chirashi Deluxe', info: '', menu_section: lunch_sect), price: '$15')
MenuPrice.create(menu_item: MenuItem.create(title: 'Ultra Chirashi', info: '', menu_section: lunch_sect), price: '$18')

# lunch combo
MenuPrice.create(menu_item: MenuItem.create(title: 'Vegetable Tempura', info: '', menu_section: lunchcombo), price: '$6.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Tempura', info: '2pc shrimp tempura &amp; mixed veggie tempura', menu_section: lunchcombo), price: '$8.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Crab Cake &amp; Tempura', info: 'Deep fried creamy crab cake &amp; assorted tempura', menu_section: lunchcombo), price: '$7.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Karaage &amp; Tempura', info: 'Boneless fried chicken &amp; assorted tempura', menu_section: lunchcombo), price: '$8.50')
MenuPrice.create(menu_item: MenuItem.create(title: 'Teriyaki Chicken &amp; Tempura', info: 'White meat teriyaki chicken &amp; assorted tempura', menu_section: lunchcombo), price: '$7.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Saikoro Steak &amp; Tempura', info: 'Bite-size steak w/ special sauce &amp; assorted tempura', menu_section: lunchcombo), price: '$9.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Miso Seabass &amp; Tempura', info: 'Miso marinated seabass &amp; assorted tempura', menu_section: lunchcombo), price: '$18')
MenuPrice.create(menu_item: MenuItem.create(title: 'Sushi &amp; Tempura', info: '5pcs of Chef\'s choice sushi &amp; assorted tempura', menu_section: lunchcombo), price: '$9.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Sushi &amp; Roll', info: '5pcs of Chef\'s choice sushi &amp; choice of spicy tuna or california roll', menu_section: lunchcombo), price: '$9.95')
MenuPrice.create(menu_item: MenuItem.create(title: 'Sushi Combo', info: '9pcs. Chef\'s choice sushi', menu_section: lunchcombo), price: '$14')
MenuPrice.create(menu_item: MenuItem.create(title: 'Sashimi Combo', info: '5 kinds of Chef\'s choice sashimi', menu_section: lunchcombo), price: '$18')
MenuPrice.create(menu_item: MenuItem.create(title: 'Mini Chirashi Combo', info: 'Mini chirashi w/ hot or cold cha-soba', menu_section: lunchcombo), price: '$14')
MenuPrice.create(menu_item: MenuItem.create(title: 'Bento Box of the Day', info: 'Please ask server', menu_section: lunchcombo), price: '$14')

# lunch drinks
MenuPrice.create(menu_item: MenuItem.create(title: 'Soft Drinks (7up, Coke, Diet Coke)', menu_section: lunchdrinks), price: '$1.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Iced Green Tea', menu_section: lunchdrinks), price: '$2')
MenuPrice.create(menu_item: MenuItem.create(title: 'Kirin Draft', menu_section: lunchdrinks), price: '$2.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'House Wine', menu_section: lunchdrinks), price: '$4')
MenuPrice.create(menu_item: MenuItem.create(title: 'House Sake', menu_section: lunchdrinks), price: '$4')

# desserts
MenuPrice.create(menu_item: MenuItem.create(title: 'Green Tea Crème Brulee', menu_section: lunchdess), price: '$5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Warm Choclate Cake', menu_section: lunchdess), price: '$5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Assorted Dessert Platter', menu_section: lunchdess), price: '$12')

# dinner
dinner_col01 = MenuColumn.create(span: 4, cols: 1, menu_page: dinner)
dinner_col02 = MenuColumn.create(span: 4, cols: 1, menu_page: dinner)
dinner_col03 = MenuColumn.create(span: 4, cols: 1, menu_page: dinner)

# soups &amp; starters
soups_n_starters = MenuSection.create(title: 'Soups &amp; Starters', menu_column: dinner_col01)
MenuPrice.create(menu_item: MenuItem.create(title: 'Miso Soup', info:, 'w/ tofu, seaweed &amp; green onions', menu_section: soups_n_starters), price: '2')
MenuPrice.create(menu_item: MenuItem.create(title: 'Amaebi Miso Soup', info:, 'miso soup w/ sweet shrimp head', menu_section: soups_n_starters), price: '3.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Steamed Rice', info:, 'the best japanese rice \'tamanishiki\'', menu_section: soups_n_starters), price: '2')
MenuPrice.create(menu_item: MenuItem.create(title: 'Edamame', info:, 'our special \'kuro edamame\'', menu_section: soups_n_starters), price: '3')
MenuPrice.create(menu_item: MenuItem.create(title: 'Baby Crispy Spice Tuna', info:, '1/2 size crispy spicy tuna', menu_section: soups_n_starters), price: '4')
MenuPrice.create(menu_item: MenuItem.create(title: 'Sauteed Green Beans', menu_section: soups_n_starters), price: '5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Shishito Peppers', info:, 'topped w/ bonito flakes', menu_section: soups_n_starters), price: '5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Steamed Asparagus', info:, 'w/ spicy mayo', menu_section: soups_n_starters), price: '6.5')
MenuPrice.create(menu_item: MenuItem.create(title: 'Dynamite Mussels', info:, 'green mussels baked w/ dynamite papaya sauce', menu_section: soups_n_starters), price: '7')
MenuPrice.create(menu_item: MenuItem.create(title: 'Fried Calamari', info:, 'w/ special sauce', menu_section: soups_n_starters), price: '7')
