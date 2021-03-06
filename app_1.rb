require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, 'sqlite3:_pizzashop.db'

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
end

post '/cart' do
	
	#recieve parametrs list and parse
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

	#show message if card is empty
	if @items.length == 0
		return erb :cart_empty
	end

	#show list products in cart
	@items.each do |item|
		#id, cnt
		item[0] = Product.find(item[0])
	end

    erb :cart
end

#undefined method `split' for nil:NilClass
# add to_s !!!!!!!!!
def parse_orders_input orders_input
	s1 = orders_input.to_s.split(/,/)

	arr = []

	s1.each do |x|
		s2 = x.split(/\=/)

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr.push arr2
	end

	return arr
end