PRICING = {
"milk" => {
  unit_price: 3.97, 
  sale_quantity: 2, 
  sale_price: 5.00
}, 
"bread" => { 
  unit_price: 2.17, 
  sale_quantity: 3, 
  sale_price: 6.00
},
"banana" => {
  unit_price: 0.99
},
"apple" => {
  unit_price: 0.89
}
}

puts "please enter all the items purchased separated by a comma"
input = gets.chomp
items = input.split(",").map(&:strip).map(&:downcase)
#count items
item_counts = Hash.new(0)
items.each {|item| item_counts[item] += 1}
total_price = 0.0
puts "\nItem     Quantity     Price"
puts "-------------------------------"

item_counts.each do |item, quantity|
  pricing = PRICING[item]
  item_total = 0.0
  if pricing[:sale_quantity]
    sale_sets = quantity / pricing[:sale_quantity]
    remaining = quantity % pricing[:sale_quantity]
    item_total += sale_sets * pricing[:sale_quantity]
    item_total += remaining * pricing[:unit_price]
  else
    item_total = quantity * pricing[:unit_price] 
  end
  total_price += item_total
  puts "#{item.capitalize.ljust(8)} #{quantity.to_s.ljust(12)} $#{format('%.2f', item_total)}"
end
puts "\nTotal price : $#{format('%.2f', total_price)}"
