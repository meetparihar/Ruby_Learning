=begin
Write a ruby program to get a string made of the first 2 and the last 2 chars from a given a string. 
   If the string length is less than 2, return "Empty String"   
=end


puts("Enter a string with length > 2")
str = gets.chomp
puts(str[0..1].concat(str[-2..]))