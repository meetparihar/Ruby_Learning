=begin
    1. Write a program check_inputs.rb that gets two inputs  and checks that the first represents a valid int
number and that the second represents a valid float number. (Exception handling)
=====================================
=end
begin
    puts "Enter input 1: "
    inp1 = gets.chomp
    inp1_i = inp1.to_i
    if (inp1 != inp1_i.to_s)
        raise 'First input is not an integer'        
    end
    puts "Enter input 2: "
    inp2 = gets.chomp
    inp2_f = inp2.to_f
    if (inp2 != inp2_f.to_s)
        raise 'Second input is not a Float'        
    end
rescue Exception => e
    puts e.message
ensure
    puts "Program ran successfully"
end

