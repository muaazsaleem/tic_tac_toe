
require "./rows_columns_diagnols.rb"

class Board

	def initialize 
		@squares = [[" "," "," "], [" "," "," "], [" "," "," "]] #squares[rows][columns]
		@rows = []
		@columns = []
		@diagnols = [] #diagnol[0] = [[0,0],[1,1],[2,2]] diagnol[1] = [[0,2],[1,1],[2,0]]
		
		3.times do |i|
			3.times do |j|
				@squares[i][j] = Square.new(" ")
			end
		end

		3.times { |i| @rows[i] = Row.new }
		3.times { |i| @columns[i] = Column.new}
		2.times { |i| @diagnols[i] = Diagnol.new }
		
		@diagnols[0] = [@squares[0,0], @squares[1,1], @squares[2,2]]
		@diagnols[1] = [@squares[0,2], @squares[1,1], @squares[2,0]]

		3.times do |i|
			3.times do |j|
				@rows[i].squares[j] =  @squares[i][j] 
				@columns[j].squares[j] = @squares[i][j] 
				
			end
			
		end
	end

	def display
		3.times do |i|
			3.times do |j|
				print "|#{@rows[i].squares[j].input}"
			end
			puts "| "
		end
	end
	def move row, column, input
		@rows[row].squares[column].input = input
	end


	
end

game_board = Board.new
game_board.display
game_board.move(0,1,:x)
game_board.display
