class Group
    attr_reader :name, :names_array
    
    def initialize(group_name)
        @name = group_name
        @names_array = ["Alice", "Bob", "Charlie", "Dylan", "Eddie"]
    end

    def randomise_order 
        @names_array.shuffle
    end

    def output_random_array
        randomise_order.each do |name|
            puts name 
        end 
    end

    def add_name(name)
        @names_array.push(name)
    end 


end 
