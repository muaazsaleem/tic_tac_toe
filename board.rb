
require "./rows_columns_diagnols.rb"

class Board

	def initialize 
		
		@rows = []
		@columns = []
		@diagnols = [] #diagnol[0] = [[0,0],[1,1],[2,2]] diagnol[1] = [[0,2],[1,1],[2,0]]
		
		

		3.times { |i| @rows[i] = Row.new }
		3.times { |i| @columns[i] = Column.new}
		2.times { |i| @diagnols[i] = Diagnol.new }
		
		@diagnols[0] = [@rows[0].squares[0], @rows[1].squares[1], @rows[2].squares[2]]
		@diagnols[1] = [@rows[0].squares[2], @rows[1].squares[1], @rows[2].squares[0]]


		3.times do |i|
			3.times do |j|
				@rows[i].squares[j] =  " "
				@columns[j].squares[j] = @rows[i].squares[j]
				
			end
			
		end
	end

	def display
		5.times { print "="}
		puts " "
		3.times do |i|
			3.times do |j|
				if @rows[i].squares[j].class == Square
					print "|#{@rows[i].squares[j].input}"
				else
					print "|#{@rows[i].squares[j]}"
				end
			end
			puts "| "
			
		end
	end
	def move row, column, input
		
		if !(@rows[row].squares[column].class == Square)
			@rows[row].squares[column] = Square.new(input) 
			true
		else
			false
		end
		

	end


	
end

game_board = Board.new
game_board.display
p game_board.move(0,1,:x)
game_board.display
p game_board.move(0,1,:x)
game_board.display

