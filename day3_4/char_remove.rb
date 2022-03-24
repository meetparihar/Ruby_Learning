# Write a ruby function to remove the characters which have odd index values of a given string.

print " Enter a string "
str = gets.chomp
str2 = ''
for i in 0..str.length
    if i%2 == 0
        str2 += str[i].to_str
    end
end
puts (" After odd removal the string is #{str2} ")

