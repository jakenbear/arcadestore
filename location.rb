#LOCATION class
class Location
  attr_accessor :id,:name,:city,:product_list
  def initialize(id,name,city)
    @id = id
    @name = name
    @city = city
    @product_list = {}
    puts "NEW LOCATION ADDED - ID: #{@id}, NAME: #{@name}, CITY: #{@city}"
  end

  def to_s
    "Location Id: #{@id}, #{@name}, #{@city}, #{@product_list}"
  end

  def display_info
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "City: #{@city}"
    puts "Product List: #{@product_list}"
  end

  #Database: Add a PRODUCT by Qauntity
  def add_product(prod,q)
    #newq = @product_list[prod]
    if @product_list[prod] != nil
      newq = @product_list[prod] + q
      @product_list[prod] = newq
        puts "Added #{q} new items to #{name}"
    else
      @product_list[prod] = q
      puts "Added #{q} items to #{name}"
    end
  end

  #Database: Remove a PRODUCT by Qauntity
  def remove_product(prod,q)
    newq = @product_list[prod] - q
    if newq >= 0
      #We have enough products to remove
      @product_list[prod] = newq
      return 99
    else
      puts "Error: Not that many to remove!"
      return 0
    end
  end

  #Database: Return Quantity for Product Id
  def get_qauntity(prod)
    qty = @product_list[prod]
    if qty == nil
      return 0
    else
      return qty
    end
  end

end #location Class
