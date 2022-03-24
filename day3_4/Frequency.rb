=begin
1. Write a ruby function which counts the frequency of given character in a given string. 
   Inputs - A String A Character whose frequency needs to be determined    
=end


def find_occurence(str, chr)
    res = 0
    for i in 0..str.length
        if str[i] == chr
           res +=1
        end
    end
    return res
end
print " Enter String "
str = gets.chomp
print " Enter character"
chr = gets.chomp[0]
puts(find_occurence str,chr)