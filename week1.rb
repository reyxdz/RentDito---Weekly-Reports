class Item
  attr_accessor :id, :name, :price
  
  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
  end
  
  def to_s
    "ID: #{@id}, Name: #{@name}, Price: #{@price}"
  end
end

class Store
  def initialize
    @items = []
    @next_id = 1
  end
  
  # CREATE
  def add_item(name, price)
    item = Item.new(@next_id, name, price)
    @items << item
    @next_id += 1
    puts "Item added!"
  end
  
  # READ - All
  def list_items
    if @items.empty?
      puts "No items found."
    else
      @items.each { |item| puts item }
    end
  end
  
  # READ - One
  def find_item(id)
    @items.find { |item| item.id == id }
  end
  
  # UPDATE
  def update_item(id, name, price)
    item = find_item(id)
    if item
      item.name = name
      item.price = price
      puts "Item updated!"
    else
      puts "Item not found!"
    end
  end
  
  # DELETE
  def delete_item(id)
    item = find_item(id)
    if item
      @items.delete(item)
      puts "Item deleted!"
    else
      puts "Item not found!"
    end
  end
end

# Main Program
store = Store.new

loop do
  puts "\n=== CRUD Menu ==="
  puts "1. Add Item"
  puts "2. List Items"
  puts "3. Update Item"
  puts "4. Delete Item"
  puts "5. Exit"
  print "Choose: "
  choice = gets.chomp.to_i
  
  case choice
  when 1
    print "Enter name: "
    name = gets.chomp
    print "Enter price: "
    price = gets.chomp.to_f
    store.add_item(name, price)
  when 2
    store.list_items
  when 3
    print "Enter ID to update: "
    id = gets.chomp.to_i
    if store.find_item(id)
      print "Enter new name: "
      name = gets.chomp
      print "Enter new price: "
      price = gets.chomp.to_f
      store.update_item(id, name, price)
    else
      puts "Item not found!"
    end
  when 4
    print "Enter ID to delete: "
    id = gets.chomp.to_i
    store.delete_item(id)
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid choice!"
  end
end
