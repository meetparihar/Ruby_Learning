# 5. Write a ruby function to insert a string in the middle of a string. For odd length of string, remove the middle character and replace with given string.

def middle_insertion(str, str_mid)
    res = ''
    l = str.length
    if l%2==0
        res = str[0..(l/2.to_i - 1)] + str_mid + str[l/2..]
       
    else
        res = str[0..(l/2.to_i - 1)] + str_mid + str[(l/2.to_i + 1)..]
    end
    return res
end
print " Enter string "
str = gets.chomp
print " Enter mid string"
str_mid = gets.chomp
puts(middle_insertion str,str_mid)