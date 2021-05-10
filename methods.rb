# puts "Loaded up the methods file"

def output_group_size(number)
    if number == 1
        puts "There is one member in the group"
    elsif number == 0 
        puts "The group is empty"
    else
        puts "There are #{number} members in the group"
    end  
end 

def menu_input_select 
    puts "Press 1) to add a member to the group"
    puts "Press 2) display a random group"
    puts "Press 3) to select random user"
    puts "Press 4) to quit"
    #take input from user
    menu_input = gets.chomp.to_i
    return menu_input
end

def output_random_group_order(collection)
    collection.shuffle.each do |name| 
        puts capitalize_multi_word_string(name)
    end 
end 


def add_member_to_group(arr)
    puts "Enter name:"
    name = gets.chomp
    arr.push(name)
end

def capitalize_multi_word_string(str)
    arr = str.split(" ")
    capitalised_array = arr.map {|word| word.capitalize}
    capitalised_string = capitalised_array.join(" ")
    return capitalised_string
end 

output_random_group_order(["tony hawk", "the rock", "someone cool"])