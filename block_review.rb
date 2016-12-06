require 'rubygems'
require 'bundler/setup'

#require_relative './widget'

#JSON representation
	widget = {color: "titanium", price: "Seventy-billion"}

#Hash Rocket representation
	widget = {:color=> "titanium", :price=> "Seventy-billion"}

#" it interprets the data" 'it doesn't'
	"panda#{widget}"
	'panda#{widget}'

#both are same
#ascending order of speed
	"panda" == 'panda'
	'panda' == 'panda'
	:panda == :panda

#puts Widget.new.sku
#sku2 =  Widget.new
#puts sku2.oh_hi

#do |f|
#you can either use DO and END pair or { } brackets
#end

#compact removes the nil values from the array
	new_array = [1,3,2,60,2, 1, 8,nil,80,9,nil,nil].compact
	puts new_array.map{|i| i+500}
#sort the array in asc order, if b<=>a is used then it sorts in desc order
	puts new_array.sort{|a,b| a<=>b}

#reading a file 
	puts File.open("./widget.rb", "r") { |f| f.read }

#Getting other file in current file without using Require
	klass =  File.open("./widget.rb", "r") { |f| f.read }
	eval(klass)
	puts Widget.new.inspect