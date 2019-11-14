#PRODUCT CLASS
class Product
  attr_accessor :id,:name,:price,:description
  def initialize(id, name, price, description)
    # Instance variables
    @id = id
    @name = name
    @price = price
    @description = description
    puts "NEW PRODUCT ADDED - ID: #{@id}, #{@name}, $#{@price}, #{@description}"
  end

  def to_s
    "Product Id: #{@id}, #{@name}, #{@price}, #{@description}"
  end

  def display_info
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Price: $#{@price}"
    puts "Description: #{@description}"
  end

end
