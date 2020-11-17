class Cli
    @@categories = ["veterans", "environment", "animals", "education", "health", "homeless"]

    def start
        puts "Welcome!"
        puts "Please select one of the following charity categories: "
        self.display_categories
        index = self.initial_input 
        query = Cli.categories[index]
        api = Api.new(query)
        api.create_charities
        Charity.display_charities
        index = self.secondary_input
        Charity.display_charity(index)
        self.another_charity?
    end 

    def initial_input
        input = gets.chomp
        index = input_to_index(input)
        if !index.between?(0, 5)
            puts "Please enter just a number between 1 and 6."
            self.initial_input
        end
        index 
    end

    def secondary_input
        input = gets.chomp 
        index = input_to_index(input)
        if !index.between?(0, 9)
            puts "Please enter just a number between 1 and 10."
            self.secondary_input
        else 
            index
        end 
    end

    def another_charity?
        puts "Would you like to see another charity?"
        puts "1. Yes."
        puts "2. No."
        input = gets.chomp 
        index = input_to_index(input)

        if index == 0
            Charity.clear_all
            self.start 
        end 
    end 

    def input_to_index(input)
        input.to_i - 1
    end

    def self.categories
        @@categories
    end 

    def display_categories
        Cli.categories.each_with_index{|cat, index| puts "#{index+1}. #{cat.capitalize}"}
    end 
end