
=begin

Write a ruby program to add 'ing' at the end of a given string (length should be at least 3). 
   If the given string already ends with 'ing' then add 'ly' instead. If the string length of the given string is less than 3, leave it unchanged.  


=end


print " Enter a string"
str = gets.chomp
if str.length>3 && str.end_with?('ing')
    puts(str.concat('ly'))    
elsif str.length>3
    puts(str.concat('ing'))    
end