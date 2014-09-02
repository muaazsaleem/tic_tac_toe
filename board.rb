
require "./rows_columns_diagnols.rb"

class Board

	def initialize 
		
		@rows = []
		@columns = []
		@diagnols = [] #diagnol[0] = [[0,0],[1,1],[2,2]] diagnol[1] = [[0,2],[1,1],[2,0]]
		
		

		3.times { |i| @rows[i] = Row.new(3) }
		3.times { |i| @columns[i] = Column.new(3)}
		2.times { |i| @diagnols[i] = Diagnol.new(3) }
		
		@diagnols[0] = [@rows[0].squares[0], @rows[1].squares[1], @rows[2].squares[2]]
		@diagnols[1] = [@rows[0].squares[2], @rows[1].squares[1], @rows[2].squares[0]]


		3.times do |i|
			3.times do |j|
				@columns[j].squares[i] = @rows[i].squares[j]
				
			end
			
		end
	end

	def display
		5.times { print "="}
		puts " "
		3.times do |i|
			3.times {|j| print "|#{@rows[i].squares[j].input}" }
			puts "| "
			
		end
		5.times { print "="}
		puts " "
	end
	
	def move row, column, input
		if @rows[row].squares[column].input == " "
			@rows[row].squares[column].input = input
			true
		else
			false
		end 
	end

	def game_ended?
		@rows.all?{|row| row.occupied?} #also covers the possiblity of columns and diagnols
	end

	def victor
		return "Nobody" unless game_ended?
		occupied = @rows.find{|row| row.occupied_by_same_user?} 
		occupied ||= @columns.find{|column| column.occupied_by_same_user?} 
		occupied ||= @diagnols.find{|diagnol| diagnol.occupied_by_same_user?} 
		occupied.occupied_by 
		
	end
	
end


