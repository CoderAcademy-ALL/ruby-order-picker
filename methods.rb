# puts "Loaded up the methods file"
require "colorize"
require "espeak"

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
    collection.shuffle.each_with_index do |name, index| 
        puts "#{index +1}. #{capitalize_multi_word_string(name)}".colorize(select_random_color)
        sleep(1)
        ESpeak::Speech.new(name).speak
    end 
end 

def select_random_color
    colours = String.colors.dup - [:black, :light_black]
    return colours.sample
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

def wait_clear(time)
    sleep(time)
    system "clear"
end 

def quit_program
    puts "type yes to quit"
    quit_choice = gets.chomp.downcase
    if quit_choice == 'yes'
        puts "Thanks for using group generator 9000"
        exit
    end 
end

