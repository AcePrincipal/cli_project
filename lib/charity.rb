class Charity
    attr_accessor :name, :url, :donation_url 
    @@all = []

    def initialize(name, url, donation_url)
        @name = name 
        @url = url 
        @donation_url = donation_url 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear_all
        @@all = []
    end 

    def self.display_charities
        puts "Please choose one of the following charities by typing a numbre and pressing enter: "
        self.all.each_with_index{|char, index| puts "#{index+1}. #{char.name}"}
    end 

    def self.display_charity(index)
        charity = self.all[index]
        puts "#{charity.name}"
        puts "#{charity.url}"
        puts "#{charity.donation_url}"
    end 
end