class AddProducts < ActiveRecord::Migration[5.1]
  def change
	Product.create ({
  	 :title => 'Hawaiian',
  	 :description => 'This is Hawaiian pizza',
  	 :price => 5,
  	 :size => 30,
  	 :is_spicy => false,
  	 :is_veg => false,
  	 :is_the_best_offer => false,
  	 :path_to_image => 'images/hawaiian.jpg'
  	 })

  	Product.create ({
  	 :title => 'Pepperoni',
  	 :description => 'This is Pepperoni pizza',
  	 :price => 7,
  	 :size => 30,
  	 :is_spicy => false,
  	 :is_veg => false,
  	 :is_the_best_offer => true,
  	 :path_to_image => 'images/pepper.jpg'
  	 })

  	Product.create ({
  	 :title => 'Vegeterian',
  	 :description => 'This is Vegeterian pizza',
  	 :price => 10,
  	 :size => 30,
  	 :is_spicy => false,
  	 :is_veg => true,
  	 :is_the_best_offer => false,
  	 :path_to_image => 'images/veg.jpeg'
  	 })
	 
  end
end
