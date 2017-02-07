Accessing_files.rb

# Two ways to open files for reading/writing
# 1. Instantiate a file object, give it instructions
file = File.new('file1.txt', 'w')
file.puts "Ruby"
file.print "programming\n"
file.write "is "
file << "fun"
file.close
# 2. Provide a file with a block of instructions
File.open('file1.txt', 'r') do |file|
while line = file.gets
puts "** " + line.chomp.reverse + " **"
end
end
# if you know you want to read every line,
# each_line will be easier
File.open('file1.txt', 'r') do |file|
file.each_line {|line| puts line.upcase }
end

# second argument is the 'mode': r, w, a, r+, w+, a+

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Arguments_default.rb

def welcome(name="World")
puts "Hello #{name}!"
end
def add(n1=0, n2=0)
puts n1 + n2
end
def longest_word(words=[])
longest_word = words.inject do |memo,word|
memo.length > word.length ? memo : word
end
puts longest_word
end
def over_five?(value=nil)
puts value.to_i > 5 ? 'Over 5' : 'Not over 5'
end
welcome("Mary")
welcome
add(2, 2)
add(3)
fruits = ['apple', 'pear', 'banana', 'plum']
longest_word(fruits)
longest_word
over_five?(112 / 18)
over_five?

--------------------------------------------------------------------

Arguments.rb

# Methods with arguments typically use parentheses.
# Methods without arguments typically do not.
# Parentheses are optional in both cases.
def welcome(name)
puts "Hello #{name}!"
end
def add(n1, n2)
puts n1 + n2
end
def longest_word(words)
longest_word = words.inject do |memo,word|
memo.length > word.length ? memo : word
end
puts longest_word
end
def over_five?(value)
puts value > 5 ? 'Over 5' : 'Not over 5'
end
welcome("Mary")
welcome("Larry")
# paretheses can also be omitted when calling
# methods with arguments
welcome "Fred"
add(2, 2)
fruits = ['apple', 'pear', 'banana', 'plum']
longest_word(fruits)
over_five?(8)
over_five?(112 / 18)

-----------------------------------------------------------------------------------------------

classes.rb

class Animal
attr_accessor :name
attr_writer :color
attr_reader :legs, :arms
@@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
@@current_animals = []
def self.species
@@species
end
def self.species=(array=[])
@@species = array
end
def self.current_animals
@@current_animals
end
def self.create_with_attributes(noise, color)
animal = self.new(noise)
animal.color = color
return animal
end
def initialize(noise, legs=4, arms=0)
@noise = noise
@legs = legs
@arms = arms
@@current_animals << self
puts "A new animal has been instantiated."
end
def noise=(noise)
@noise = noise
end
def noise
@noise
end
def color
"The color is #{@color}."
end
end
class Cow < Animal
def color
"The cow's color is #{@color}."
end
def color # second definition replaces the first
"My color is #{@color}."
end
end
class Pig < Animal
def noise
parent_noise = super
return "Hello and also #{parent_noise}"
end
end
Animal.species = ['frog', 'fish']
puts Animal.species.inspect
animal1 = Animal.new("Moo!", 4, 0)
animal1.name = "Steve"
puts animal1.name
animal1.color = "black"
puts animal1.color
puts animal1.legs
puts animal1.noise
animal2 = Animal.create_with_attributes("Quack!", "white")
puts animal2.noise
puts animal2.color
puts Animal.current_animals.inspect
maisie = Cow.create_with_attributes("Moo!", "yellow")
puts maisie.noise
puts animal1.class
puts maisie.class
puts maisie.color
wilbur = Pig.new("Oink!")
puts wilbur.noise
contact_info.rb
module ContactInfo
attr_accessor :first_name, :last_name, :city, :state, :zip_code
def full_name
return @first_name + " " + @last_name
end
def city_state_zip
csz = @city
csz += ", #{@state}" if @state
csz += " #{@zip_code}" if @zip_code
return csz
end
end

***********************************************************************************************************************

file_location.rb

# Absolute paths
# Use forward slashes, even on Windows
puts "/Users/kevin/Desktop/ruby_sandbox"
# File.join ensures platform independence
puts File.join('', 'Users', 'kevin', 'Desktop', 'ruby_sandbox')
# Relative paths
# __FILE__ is THIS file
puts __FILE__
# expand_path will convert a relative path to an absolute path
# in this case, it returns the full path the file
puts File.expand_path(__FILE__)
# relative paths are easiest when you start with
# this file's directory
puts File.dirname(__FILE__)
# .. "moves back" one directory
puts File.join(File.dirname(__FILE__), '..', "Exercise\ Files")
input_output.rb
# gets: waits for user input--a single line ending in a return
# chomp: removes any line ending ("\n", "\r", "\r\n")
# chop: would remove ANY final character (chomp is usually better)
input = gets.chomp
# print: outputs a string with no line return
# puts: outputs a string with a line return
print "You just told me: "
puts input + "."
# Use gets inside a loop for more user input
result = ""
until result == "quit"
print "> "
result = gets.chomp
puts "I heard: #{result}"
end
puts "Goodbye!"
method_scope.rb
value = 7
def welcome
puts "Hello World!"
end
def add
puts 1 + 1
end
# Global, class and instance variables are available
# inside a method's scope
@words = ['apple', 'pear', 'banana', 'plum']
def longest_word
longest_word = @words.inject do |memo,word|
memo.length > word.length ? memo : word
end
puts longest_word
end
def over_five?
# local variables inside a method are LOCAL to the method
# They don't "pull in" local variables (unlike blocks).
# They don't persist once the method is done.
value = 3
puts value > 5 ? 'Over 5' : 'Not over 5'
end
welcome
add
longest_word
over_five?
# outputs the original, unchanged value
puts value
# Be careful about naming methods and local variables.
# They can look the same.
puts longest_word
# This is calling the method 'longest_word', not the local
# variable 'longest_word' inside that method.

--------------------------------------------------------------------------------------------------------------------

Method.rb

def welcome
puts "Hello World!"
end
def add
puts 1 + 1
end
# Underscore between words, like variable names
def longest_word
words = ['apple', 'pear', 'banana', 'plum']
longest_word = words.inject do |memo,word|
memo.length > word.length ? memo : word
end
puts longest_word
end
# Method names can have question marks in them
# Useful for tests and booleans
def over_five?
value = 3
puts value > 5 ? 'Over 5' : 'Not over 5'
end
# must define methods before calling them!
welcome
add
longest_word
over_five?
Person.rb
require 'contact_info.rb'
class Person
include ContactInfo
end
require 'contact_info.rb'
class Teacher
include ContactInfo
attr_accessor :lesson_plans
end
class Student < Person
attr_accessor :books, :grades
end
return_value.rb
# Default return value is the last operation's return value
# (unless you explicitly return before it)
def welcome(name="World")
return "Hello #{name}!"
2 + 2
end
# methods return only one value
# return multiple values as array
def add_and_subtract(n1=0, n2=0)
add = n1 + n2
sub = n1 - n2
return [add, sub]
end
# Returning a value instead of outputting it from
# inside a method can give you greater flexiblity.
def longest_word(words=[])
longest_word = words.inject do |memo,word|
memo.length > word.length ? memo : word
end
return longest_word
end
# Return doesn't have to be at the end
# and there can be more than one.
# Useful for conditional statements.
def over_five?(value=nil)
return "Exactly 5" if value.to_i == 5
if value.to_i > 5
return "Over 5"
else
return "Under 5"
end
end
welcome("Mary")
returned_value = welcome("John")
puts returned_value
result = add_and_subtract(2, 2)
puts result[0]
puts result[1]
add, sub = add_and_subtract(8, 3)
fruits = ['apple', 'pear', 'banana', 'plum']
puts longest_word(fruits).length
puts over_five?(112 / 18)
syntactic_sugar.rb
puts 8 + 2
puts 8.+(2)
puts 8 - 2
puts 8.-(2)
puts 8 * 2
puts 8.*(2)
puts 8 / 2
puts 8./(2)
puts 8 ** 2
puts 8.**(2)
array1 = [1,2,3]
puts array1.inspect
array2 = [1,2,3]
puts array2.inspect
array1 << 4
puts array1.inspect
array2.<<(4)
puts array2.inspect
array1[2]
puts array1.inspect
array2.[](2)
puts array2.inspect
array1[2] = 'x'
puts array1.inspect
array2.[]=(2, 'x')
puts array2.inspect
to_do_list.rb
class ToDoList
include Enumerable
attr_accessor :items
def initialize
@items = []
end
def each
@items.each {|item| yield item}
end
end
# list = ToDoList.new
# list.items = ['laundry', 'dishes', 'vacuum']
# list.items.select {|i| i.length > 6 }
Food Finder project

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Number_helper.rb

# This module illustrates how additional functionality can be
# included (or "mixed-in") to a class and then reused.
# Borrows heavily from Ruby on Rails' number_to_currency method.
module NumberHelper
def number_to_currency(number, options={})
unit = options[:unit] || '$'
precision = options[:precision] || 2
delimiter = options[:delimiter] || ','
separator = options[:separator] || '.'
separator = '' if precision == 0
integer, decimal = number.to_s.split('.')
i = integer.length
until i <= 3
i -= 3
integer = integer.insert(i,delimiter)
end
if precision == 0
precise_decimal = ''
else
# make sure decimal is not nil
decimal ||= "0"
# make sure the decimal is not too large
decimal = decimal[0, precision-1]
# make sure the decimal is not too short
precise_decimal = decimal.ljust(precision, "0")
end
return unit + integer + separator + precise_decimal
end
end

*----------------------------------------------------------------------------------------------------------*

string_extend.rb

# This helper is opening up core Ruby String class
# in order to add a new method to all strings
class String
# Ruby has a capitalize method (used below) which
# capitalizes the first letter of a string. But in
# order to capitalize the first letter of EVERY
# word we have to write our own.
def titleize
self.split(' ').collect {|word| word.capitalize}.join(" ")
end
end
guide.rb
require 'restaurant'
require 'support/string_extend'
class Guide
class Config
@@actions = ['list', 'find', 'add', 'quit']
def self.actions; @@actions; end
end
def initialize(path=nil)
# locate the restaurant text file at path
Restaurant.filepath = path
if Restaurant.file_usable?
puts "Found restaurant file."
# or create a new file
elsif Restaurant.create_file
puts "Created restaurant file."
# exit if create fails
else
puts "Exiting.\n\n"
exit!
end
end
def launch!
introduction
# action loop
result = nil
until result == :quit
action, args = get_action
result = do_action(action, args)
end
conclusion
end
def get_action
action = nil
# Keep asking for user input until we get a valid action
until Guide::Config.actions.include?(action)
puts "Actions: " + Guide::Config.actions.join(", ")
print "> "
user_response = gets.chomp
args = user_response.downcase.strip.split(' ')
action = args.shift
end
return action, args
end
def do_action(action, args=[])
case action
when 'list'
list(args)
when 'find'
keyword = args.shift
find(keyword)
when 'add'
add
when 'quit'
return :quit
else
puts "\nI don't understand that command.\n"
end
end
def list(args=[])
sort_order = args.shift
sort_order = args.shift if sort_order == 'by'
sort_order = "name" unless ['name', 'cuisine', 'price'].include?(sort_order)
output_action_header("Listing restaurants")
restaurants = Restaurant.saved_restaurants
restaurants.sort! do |r1, r2|
case sort_order
when 'name'
r1.name.downcase <=> r2.name.downcase
when 'cuisine'
r1.cuisine.downcase <=> r2.cuisine.downcase
when 'price'
r1.price.to_i <=> r2.price.to_i
end
end
output_restaurant_table(restaurants)
puts "Sort using: 'list cuisine' or 'list by cuisine'\n\n"
end
def find(keyword="")
output_action_header("Find a restaurant")
if keyword
restaurants = Restaurant.saved_restaurants
found = restaurants.select do |rest|
rest.name.downcase.include?(keyword.downcase) ||
rest.cuisine.downcase.include?(keyword.downcase) ||
rest.price.to_i <= keyword.to_i
end
output_restaurant_table(found)
else
puts "Find using a key phrase to search the restaurant list."
puts "Examples: 'find tamale', 'find Mexican', 'find mex'\n\n"
end
end
def add
output_action_header("Add a restaurant")
restaurant = Restaurant.build_using_questions
if restaurant.save
puts "\nRestaurant Added\n\n"
else
puts "\nSave Error: Restaurant not added\n\n"
end
end
def introduction
puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
puts "This is an interactive guide to help you find the food you crave.\n\n"
end
def conclusion
puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
end
private
def output_action_header(text)
puts "\n#{text.upcase.center(60)}\n\n"
end
def output_restaurant_table(restaurants=[])
print " " + "Name".ljust(30)
print " " + "Cuisine".ljust(20)
print " " + "Price".rjust(6) + "\n"
puts "-" * 60
restaurants.each do |rest|
line = " " << rest.name.titleize.ljust(30)
line << " " + rest.cuisine.titleize.ljust(20)
line << " " + rest.formatted_price.rjust(6)
puts line
end
puts "No listings found" if restaurants.empty?
puts "-" * 60
end
end

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

restaurant.rb

require 'support/number_helper'
class Restaurant
include NumberHelper
@@filepath = nil
def self.filepath=(path=nil)
@@filepath = File.join(APP_ROOT, path)
end
attr_accessor :name, :cuisine, :price
def self.file_exists?
# class should know if the restaurant file exists
if @@filepath && File.exists?(@@filepath)
return true
else
return false
end
end
def self.file_usable?
return false unless @@filepath
return false unless File.exists?(@@filepath)
return false unless File.readable?(@@filepath)
return false unless File.writable?(@@filepath)
return true
end
def self.create_file
# create the restaurant file
File.open(@@filepath, 'w') unless file_exists?
return file_usable?
end
def self.saved_restaurants
# We have to ask ourselves, do we want a fresh copy each
# time or do we want to store the results in a variable?
restaurants = []
if file_usable?
file = File.new(@@filepath, 'r')
file.each_line do |line|
restaurants << Restaurant.new.import_line(line.chomp)
end
file.close
end
return restaurants
end
def self.build_using_questions
args = {}
print "Restaurant name: "
args[:name] = gets.chomp.strip
print "Cuisine type: "
args[:cuisine] = gets.chomp.strip
print "Average price: "
args[:price] = gets.chomp.strip
return self.new(args)
end
def initialize(args={})
@name = args[:name] || ""
@cuisine = args[:cuisine] || ""
@price = args[:price] || ""
end
def import_line(line)
line_array = line.split("\t")
@name, @cuisine, @price = line_array
return self
end
def save
return false unless Restaurant.file_usable?
File.open(@@filepath, 'a') do |file|
file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
end
return true
end
def formatted_price
number_to_currency(@price)
end
end

###################################################################################################

init.rb

#### Food Finder ####
#
# Launch this Ruby file from the command line
# to get started.
#
APP_ROOT = File.dirname(__FILE__)
# require "#{APP_ROOT}/lib/guide"
# require File.join(APP_ROOT, 'lib', 'guide.rb')
# require File.join(APP_ROOT, 'lib', 'guide')
$:.unshift( File.join(APP_ROOT, 'lib') )
require 'guide'
guide = Guide.new('restaurants.txt')
guide.launch!
restaurant.txt
Hot Tamale Mexican 25
Cafe Masala Indian 30
pita pocket Fast food 10
Quick Cup coffee 5
Taste of Little Italy pizza 10
Mallard House New American 35
