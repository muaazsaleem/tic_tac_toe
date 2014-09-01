
require "./rows_columns_diagnols.rb"

class Board

	def initialize 
		@squares = [[" "," "," "], [" "," "," "], [" "," "," "]] #squares[rows][columns]
		@rows = []
		@columns = []
		@diagols = [] #diagnol[0] = [[0,0],[1,1],[2,2]] diagnol[1] = [[0,2],[1,1],[2,0]]
		
		3.times do |i|
			3.times do |j|
				@squares[i][j] = Square.new
			end
		end



		3.times { |i| @rows[i] = Row.new }
		3.times { |i| @columns[i] = Column.new}
		2.times { |i| @diagols[i] = Diagnol.new }
		
		3.times do |i|
			3.times do |j|
				@rows[i].squares[j] =  @squares[i][j] 
				@columns[j].squares[j] = @squares[i][j] 
				
			end
			
		end
	end
	
end

Board.new