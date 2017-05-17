# Question 1
# Implement the following code in Ruby:
# Create a module called HelperMethods
# that include a method called titleize that does the following:
# it takes in a string and returns the string back after capitalizing each word in that string.

# For example, if you pass to the method a string "hello world" you should get back "Hello World".
# The methods should not capitalize the following words: in, the, of, and, or, from.
# Then write a piece of code to demonstrate the difference between include and extend in using Ruby modules with classes to include methods. Make sure to demonstrate calling the titleize methods with your code.

module HelperMethods
  def titleize str
    exclude = ['in', 'the', 'of', 'and', 'or', 'from']
    title = str.split(' ')
    title[0].capitalize!
    title.each do |word|
      word.capitalize! if !exclude.include?(word)
    end
    title.join(' ')
  end
end

class ExtendModule
  extend HelperMethods
end

class IncludeModule
  include HelperMethods
end



print "\n"
puts "==================Q1====================="

print "\n"
puts "==================Extend=================="
print "\n"
puts 'extend can run the module on the class'
puts 'ExtendModule.titleize(\'this is a title\')'
print 'result: '
puts ExtendModule.titleize('this is a title')
print "\n"

print "\n"
puts 'extend will throw an error if run on class instance'
puts 'e = ExtendModule.new()'
e = ExtendModule.new()
puts 'e.titleize(\'this is a title\')'
print 'result: '
begin
  e.titleize('this is a title')
rescue
  puts 'raised a NoMethodError'
end
print "\n"




puts "==================Include=================="
print "\n"
puts 'include can only run on a class instance'
puts 'i = IncludeModule.new()'
i = IncludeModule.new()
puts 'i.titleize(\'this is a title\')'
i.titleize('this is a title')
print 'result: '
puts i.titleize('this is a title')
print "\n"


print "\n"
puts "include will throw an error if run on the class"
puts 'IncludeModule.titleize(\'this is a title\')'
print 'result: '
begin
  IncludeModule.titleize('this is a title')
rescue NoMethodError
  puts 'raised a NoMethodError'
end
print "\n"






# Question 2
# Build a Ruby class called Book. Objects of the Book class must have two attributes:
# title
# chapters

# Objects must have two methods:
# add_chapter
# chapters

# The add_chapter method adds a chapter by giving it a title.
# The chapters method should display the number of chapters and lists all the chapters as in:
#
# book = Book.new
# book.title = "My Awesome Book"
# book.add_chapter("My Awesome Chapter 1")
# book.add_chapter("My Awesome Chapter 2")
# book.chapters
# # This should print:
# # Your book: My Awesome Book has 2 chapters:
# # 1. My Awesome Chapter 1
# # 2. My Awesome Chapter 2

class Book

  attr_accessor :title, :arr_ch
  include HelperMethods

  def initialize title
    @title = title
    @arr_ch = []
  end

  def add_chapter chapter
    arr_ch.push(titleize(chapter))
  end

  def chapters
    puts "Your book: #{title} has #{arr_ch.length} chapters:"
    (1..arr_ch.length).each do |i|
      puts "#{i}. #{arr_ch[i-1]}"
    end
  end

end

b = Book.new('my awesome book')

b.add_chapter("my awesome chapter 1")
b.add_chapter("my awesome chapter 2")
b.add_chapter("my awesome chapter 3")
b.add_chapter("my awesome chapter 4")
b.add_chapter("my awesome chapter 5")

b.arr_ch

b1 = Book.new('the other book')

print "\n"
puts "==================Q2=================="
print "\n"
b.chapters



# Question 3
# Write a Ruby method called: is_prime. The function must take a number n and it should return true or false whether the argument passed (n) is a prime number or not. A prime number is a number that is divisible only by 1 and itself.

def is_prime? num
  return false if num <= 1
  !(2..Math.sqrt(num)).map{|i| num % i == 0}.include? true
end


print "\n"
puts "==================Q3=================="
print "\n"
p [1,2,3,4,5,7,9,7211]
p [1,2,3,4,5,7,9,7211].map {|i| is_prime?i}


# Question 4
# Given a ruby Hash that looks like this:
#
# var major_cities = {BC: ["Vancouver", "Victoria", "Prince George"], AB: ["Edmonton", "Calgary"]}
# Write a piece of code that loops through the object and prints the following to the console:
#
# BC has 3 main cities: Vancouver, Victoria, Prince George
# AB has 2 main cities: Edmonton, Calgary


print "\n"
puts "==================Q4=================="
print "\n"
major_cities = {BC: ["Vancouver", "Victoria", "Prince George", "Burnaby"], AB: ["Edmonton", "Calgary"]}

major_cities.each do |key, value|
  puts "#{key} has #{value.length} main cities: #{value.join(', ')}"
end


print "\n"
puts "===============Stretch=================="
print "\n"
# [Stretch]: Make sure that there is an and before the last one:
#
# BC has 3 main cities: Vancouver, Victoria and Prince George
# AB has 2 main cities: Edmonton and Calgary
major_cities.each do |key, value|
  l = value.length
  if l == 1
    puts "#{key} has 1 main cities: #{value[0]}"
  else
    print "#{key} has #{l} main cities: #{value[0]}"
    (1..(l-2)).each do |i|
      print ', ' + value[i]
    end
    print " and #{value[l-1]}.\n"
  end
end



























#
