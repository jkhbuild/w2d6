class Player
    def get_move
        print "enter a position with coordinates separated with a space like `4 7`"
        string = gets.chomp

        [string[0].to_i, string[-1].to_i]
    end

end
