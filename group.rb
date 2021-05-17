class Group
    attr_reader :name, :names_array
    
    def initialize(group_name, file_path)
        @name = group_name
        @path = file_path
        @names_array = self.path_to_array
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

    def path_to_array
        begin 
            array = File.readlines(get_file_path).map {|name| name.strip}
        rescue 
            puts "Invalid path, creating file"
            File.open(get_file_path, "w") do |file| 
                file.write("")
            end 
            array = []
        end 
        return array 
    end
    
    def save 
        File.open(@path, "w+") do |file|
            file.puts(@names_array)
        end
    end 

    private 
    def get_file_path
        @path
    end 

end 



# test_group = Group.new("test group", "./groups/test-group.txt")
# test_group.add_name("Bob Smith")
# test_group.save