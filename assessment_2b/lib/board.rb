require "byebug"
class Board

    def self.build_stacks(num)
        Array.new(num) {Array.new(0)}
    end

    attr_reader :max_height
    def initialize(number_of_stacks, max_height)
        @max_height = max_height
        if number_of_stacks < 4 || max_height < 4
            raise 'rows and cols must be >= 4'
        else
            @stacks = Board.build_stacks(number_of_stacks)
        end
    end

    def add(token, stack_index)

        if @stacks[stack_index].length >= max_height
            return false
        else
            @stacks[stack_index] << token
            true
        end
    end

    def vertical_winner?(token)

        @stacks.each { |stack| return true if stack.count(token) == max_height}
        false
    end

    def horizontal_winner?(token)

        (0..max_height-1).each do |index|
            debugger
            count = 0
            @stacks.each { |stack| count += 1 if stack[index] == token }

            return true if count == @stacks.length
        end

        false
    end

    def winner?(token)
        self.vertical_winner?(token) || self.horizontal_winner?(token)
    end
            

            


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
