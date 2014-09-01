class Board 
	attr_accessor :rows
	def initialize
		#squares counted left to right
		@squares = []
		9.times{|i| @squares[i] = Square.new }
		#rows counted left to right, top to bottom,
		# and cross right-top-to-left-bottom and vice 
		@rows = []
		9.times{|i| @rows[i] = Row.new()}
		@rows[1].squares = [@squares[1], @squares[4], @squares[7]]
		@rows[2].squares = [@squares[2], @squares[5], @squares[8]]
		@rows[3].squares = [@squares[3], @squares[6], @squares[9]]
		@rows[4].squares = [@squares[1], @squares[2], @squares[3]]
		@rows[5].squares = [@squares[4], @squares[5], @squares[6]]
		@rows[6].squares = [@squares[7], @squares[8], @squares[9]]
		@rows[7].squares = [@squares[3], @squares[5], @squares[7]]
		@rows[8].squares = [@squares[1], @squares[5], @squares[9]]

	end

	def game_ended?
		@rows.all?{ |r| r.occupied? }
	end

	def victor
		if !game_ended?
			puts "Game's NOT Over Yet"
			
		elsif @rows.any?{|r| r.occupied_by_same_user?}
				row_occupied = @rows.select { |r| r.occupied_by_same_user? }
				row_occupied[0].occupied_by
		else
				puts "It's a draw!!!"
		end
	end

	def display
		
		(4..6).each do |i|
			puts "\t square 1 2 3" 
			print "row #{i} -" 
			@rows[i].squares.each do |j|
				print j.display
			end
			
			
			puts " " 
		end
	end
end