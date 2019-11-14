class Utils

def self.load_store_database(stores,products,locations)
  YAML.load_file('db.store').each do |entry|
    stores.push entry
  end
  puts "#{stores.size} STORE LOADED!"

  #Load products
  YAML.load_file('db.product').each do |entry|
    products.push entry
  end
  puts "#{products.size} PRODUCTS LOADED!"

  #Load LOCATIONS

  YAML.load_file('db.location').each do |entry|
    locations.push entry
  end
  puts "#{locations.size} LOCATIONS LOADED!"

end #store loads

def self.save_store_database(stores,products,locations)
  storedb = YAML::Store.new "db.store"
  locationdb = YAML::Store.new "db.location"
  productdb = YAML::Store.new "db.product"

  storedb.transaction do
    storedb["#{stores[0][0]}"] = stores[0][1]
  end

  #Product DB WRITE
  productdb.transaction do
    products.each do |item|
      productdb["#{item[0]}"] = item[1]
    end
  end

  #Location Database
  locationdb.transaction do
    locations.each do |item|
      locationdb["#{item[0]}"] = item[1]
    end
  end
end #save store database

def self.print_db(db)
  db.each do |item|
    puts item[1]
  end
end

def self.fancy_store_print(st)
  puts "====== STORE INFO ======="
  st.each do |item|
    #puts "KEY: #{item[0]}"
    puts "STORE ID: #{item[1].id}"
    puts "NAME: #{item[1].name}"
    puts "DESC: #{item[1].description}"
  end
  puts "========================="
end

def self.fancy_products_print(pd)
  puts "====== PRODUCT INFO ======="
  pd.each do |item|
      #puts "KEY: #{item[0]}"
      puts "ID: #{item[1].id}"
      puts "NAME: #{item[1].name}"
      puts "PRICE: $#{item[1].price}"
      puts "DESC: #{item[1].description}"
      puts "---------"
  end
  puts "========================="
end

def self.fancy_locations_print(lc)
  puts "====== LOCATION INFO ======="
  lc.each do |item|
      #puts "KEY: #{item[0]}"
      puts "LOCATION ID: #{item[1].id}"
      puts "NAME: #{item[1].name}"
      puts "CITY: $#{item[1].city}"
      puts "PROD LIST: #{item[1].product_list}"
  end
end

end #class
