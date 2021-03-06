require_relative("../group")

describe 'Group' do 
    before(:each) do 
        @group = Group.new("Test Group", "./groups/test-group.txt")
        @names = File.readlines("./groups/test-group.txt").map {|name| name.strip}
    end

    after(:all) do 
        test_group_array = [
            "Chris Rock",
            "Jigsaw",
            "Bill Gates",
            "Elon Musk",
            "Ted Bundy",
            "Scott Morisson",
            "Alex B",
            "Ed Gine",
            "OJ Simpson" 
        ]
        
        File.open("./groups/test-group.txt", "w+") do |file|
            file.puts(test_group_array)
        end 
    end 
    
    it 'should be an instance of a Group' do 
        expect(@group).to be_a Group
    end 

    it 'should initalise with a name property' do 
        expect(@group.name).to eq("Test Group")
    end
    
    it 'should have an array of names' do 
        expect(@group.names_array).to be_an_instance_of(Array)
    end
    
    describe '.names_array' do 
        it 'should contain the same names as the text file' do 
            expect(@group.names_array).to include(*@names)
        end 
    end 

    describe '.randomise_order' do 
        it 'should be defined' do 
            expect(defined? @group.randomise_order).to eq("method")
        end
        
        it 'should return an Array' do 
            expect(@group.randomise_order).to be_an_instance_of(Array)
        end 

        it 'should return an array that contains all items in @names_array' do 
            expect(@group.randomise_order).to include(*@group.names_array)
        end
        
    describe '.output_random_array' do 
            it 'should be defined' do 
                expect(defined? @group.output_random_array).to eq("method")
            end

            it 'should output a name from the @names_array' do 
                expect{@group.output_random_array}.to output(/#{Regexp.quote(@group.names_array.sample)}/).to_stdout
            end 
        end
        
    describe '.add_name' do 
            it 'should be defined' do 
                expect(defined? @group.add_name).to eq("method")
            end
            it 'should increase @names_array by one' do 
                length = @group.names_array.length 
                expect(@group.add_name("Bob").length).to be(length + 1)
            end 
        end 
    end
    
    describe '.save' do
        
        it 'should update the length of array we get back from the file path' do 
            @group.add_name("Bob")
            @group.save
            updated_names = File.readlines("./groups/test-group.txt").map {|name| name.strip}
            expect(updated_names.length).to be(@names.length + 1)
        end
        
        it 'should update the file with the most recently added name' do 
            @group.add_name("Alice")
            @group.save
            updated_names = File.readlines("./groups/test-group.txt").map {|name| name.strip}
            expect(updated_names.last).to eq("Alice")
        end 

    end 

end 