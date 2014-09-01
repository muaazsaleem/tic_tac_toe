#ruby-2.0.0

load "board.rb"
load "row.rb"
load "square.rb"

=begin
	The board has rows. Rows have squares. Squares are filled with x's or O's	
=end
def input user 
	puts "User #{user}'s Move."
	puts "Enter row number"
	row = gets.chomp
	puts "Enter square number"
	square = gets.chomp
	[row, square]
end

def first_user
	puts "Who gets the first turn? x or o"
	user = gets.chomp.downcase
	user.to_sym
end

game_board = Board.new
first_user = first_user()
second_user = first_user == :x ? :o : :x

while !game_board.game_ended?
	game_board.display
	input = input first_user
	game_board.rows[input[0]].squares[input[1]]  = first_user
	input = input(second_user)
	game_board.rows[input[0]].squares[input[1]]  = second_user

end

puts game_board.victor


