# 6. Write a program a function for ATM machine which takes amount as input and output should be number of notes of each denomination. 
#    The ATM has notes in following denomination : 2000, 500, 100.  Note that the ATM machine rarely gives all notes of a single amount. 
#    If you enter 4000, it will give 1 2000rs, 3 500rs and 5 100rs notes for even distribution. 
demoninations = {
    2000 => 0,
    500 => 0,
    100 => 0
}
print "Enter the amount"
amount_remaining = gets.chomp.to_i
i=0
while amount_remaining > 0
    for currency in demoninations.keys
      if amount_remaining >= currency
        demoninations[currency] += 1
        amount_remaining -= currency
      end
    #   i+=1
    #   puts ( "This loop is runnig #{i} times" )
    end
end
for x in demoninations.keys
    puts(" #{x} X #{demoninations[x]} ")    
end
