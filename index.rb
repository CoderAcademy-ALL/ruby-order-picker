require_relative "methods"
group = ["alice", "bob", "charlie"]




while true 
    group_length = group.length
    output_group_size(group_length)
    case menu_input_select
    when 1
     add_member_to_group(group)
    when 2 
        puts "Random group output:"
        random_order_loop_running = true
        while random_order_loop_running
            output_random_group_order(group)
            puts "press 1 to go back"
            puts "press 2 to quit"
            puts "press any other key to regenerate order of random group"
            choice = gets.chomp.to_i 
            if choice == 1 
                random_order_loop_running = false
            elsif choice == 2 
                quit_program
            else
                wait_clear(1)
            end 
        end
    when 3
        puts "The random user is #{group.sample.capitalize}" 
    when 4
      quit_program
    else
        puts "Invalid input please try again"
    end
    wait_clear(1.5)
end

