require "byebug"
class Board

    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n ** 2
    end

    def [](pos)
        i_row, i_col = pos
        @grid[i_row][i_col]
    end

    def []=(pos, value)
        i_row, i_col = pos
        @grid[i_row][i_col] = value
    end

    def num_ships
        count = 0

        @grid.each do |row|
            row.each { |symbol| count += 1 if symbol == :S }
        end

        count
    end

    def attack(pos)

        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        while self.num_ships != self.size / 4
            pos = [rand(0..@grid.length - 1), rand(0..@grid.length - 1)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length, :N)}
        @grid.each_with_index do |row, i1|
            row.each_with_index do |symbol, i2|
                hidden_grid[i1][i2] = symbol if symbol != :S
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)

        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


    
end