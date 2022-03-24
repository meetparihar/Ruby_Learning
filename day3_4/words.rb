# 7. Read a sentence from the standard input. Find out how many times each word appear in given string. 
#     >>> Input : 
#     “This is a ruby learning” 
#     >>> Output: 
#     >>> This 1 
#     >>> Is 1 
#     >>> a 1
#     >>> ruby 1 
#     >>> Learning 1

print " Enter a sentence "
sentence = gets.chomp
word_array = sentence.split(' ').to_a
for word in word_array.uniq
    puts( " #{word} appers #{word_array.count(word)} times")
end