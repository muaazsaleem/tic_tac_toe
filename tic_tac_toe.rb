require "./board.rb"

game_board = Board.new
game_board.display



=begin
#if I comment the assignment it gives a NoMethodError!!!!!
3.times do |i|
	3.times do |j|
		game_board.move(i,j,:x) if !game_board.game_ended?
	end
end
=end




game_board.display
p game_board.game_ended?
p game_board.victor 