require 'pry'

class Player
    attr_accessor :name , :symbol
    def initialize(name_to_save, symbol_to_save)
        @name = name_to_save
        @symbol = symbol_to_save
    end
 
end #end of class

#binding.pry