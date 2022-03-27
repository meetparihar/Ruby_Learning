=begin
2. Write a program that takes positive number from user, if negative number provided raise exception.
=end

begin
    puts " Enter the Number: "
    inp = gets.chomp.to_i
    #puts(" The entered number is #{inp}")
    if (inp == 0)
        raise " Enter a valid postive number"
    end
    if(inp<0)
        raise "Given number is negative"
    end
rescue => e 
    puts e.message
ensure
    puts " Program Ran successfully"
end