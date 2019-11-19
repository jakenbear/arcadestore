#INCLUDE CLASSES
require './store.rb'
require './location.rb'
require './product.rb'
require './utils.rb'
require 'yaml/store'
require 'rubygems'
require 'highline/import'
require 'artii'

#Store topper
topper = Artii::Base.new :font => 'slant'

# Initialize the store
stores= []
products = []
locations = []

#Load store from database files
Utils::load_store_database(stores,products,locations)

def fancy_print(msg,mode)
  if mode == 0
    topper = Artii::Base.new 
  else
    topper = Artii::Base.new :font => 'slant'
  end
  puts topper.asciify(msg)
end

#Print out Store information
def print_out_stores(s,p,l)
  Utils::fancy_store_print(s)
  Utils::fancy_products_print(p)
  Utils::fancy_locations_print(l)
end

#Print Operation 2
def print_operations(s,p,l)
  puts ("===========================")
  puts ("STORE Stock - All locations")
  puts ("===========================")
  Utils::print_db(s)
  Utils::print_db(l)
  Utils::print_db(p)
end

#Print Operation 3
def print_operations_pro(p)
  fancy_print('PRODUCTS',0)
  Utils::print_db(p)
end

def print_operations_loc(l)
  fancy_print('LOCATION INFO',1)
  Utils::print_db(l)
end

def transfer_items(s,p,l,storeid,qty,prodid,from_loc,to_loc)
  s[storeid][1].transfer_product(qty,prodid,l[from_loc][1],l[to_loc][1])
end

def transfer_items_pro(s,p,l,storeid,qty,prodid,from_loc,to_loc)
  storeid = 0
  qty = 1
  prodid = 1
  from_loc = 0
  to_loc = 1
  s[storeid][1].transfer_product(qty,prodid,l[from_loc][1],l[to_loc][1])
end

#locations[0][1].remove_product(2,5)
#locations[0][1].remove_product(2,50000)
#frog = locations[0][1].get_qauntity(1)

#locations[0][1].add_product(1,8)
#locations[0][1].add_product(2,10)
#locations[1][1].add_product(2,7)
#locations[1][1].add_product(3,12)
#locations[1][1].add_product(4,20)
#locations[2][1].add_product(5,2)
#locations[2][1].add_product(6,3)


#TEST ZONE
#stores[0][1].display_info
#stores[0][1].display_info_detailed(locations,products)
#stores[0][1].show_store_inventory_item(locations,products,2)
#stores[0][1].transfer_product(5,1,locations[0][1],locations[1][1])

#Write to Save file
Utils::save_store_database(stores,products,locations)


begin
  puts
  loop do
    puts topper.asciify('JAKES STORE')
    choose do |menu|
      menu.prompt = "Please select store Operation:"
      menu.choice(:"Print Store Information") { print_out_stores(stores,products,locations) }
      menu.choice(:"Show STORE Stock - All locations") { print_operations(stores,products,locations) }
      menu.choice(:"Show PRODUCT Information") { print_operations_pro(products) }
      menu.choice(:"Show LOCATION Information") { print_operations_loc(locations) }
      menu.choice(:"Transfer TEST") { transfer_items(stores,products,locations,0,1,2,0,1) }
      menu.choice(:"Transfer TEST - REVERSE") { transfer_items(stores,products,locations,0,1,2,1,0) }
      menu.choice(:Quit, "Exit program.") { exit }
    end
  end
end


#PERFORM OPERATIONS ON STORE - END
# Get a Location Specific Quantity for one product.
# location.get_qauntity(productID)

# Display Store INFO
# store.display_info

# Show all Inventory in a Store (All locations)
# store.show_store_inventory(locations)
