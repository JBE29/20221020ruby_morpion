require 'pry'

class BoardCase
    attr_accessor :position, :content
    
    def initialize (save_position, save_content)
        @position = save_position
        @content = save_content
    end
end #end of class