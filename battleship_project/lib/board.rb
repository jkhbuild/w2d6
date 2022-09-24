class Board

    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n ** 2
    end

    def [](indices_pair)
        i_row, i_col = indices_pair
        @grid[i_row][i_col]
    end

    def []=(indices_pair, value)
        i_row, i_col = indices_pair
        @grid[i_row][i_col] = value
    end

    def num_ships
        count = 0

        @grid.each do |row|
            row.each { |symbol| count += 1 if symbol == :S }
        end

        count
    end
  
end
