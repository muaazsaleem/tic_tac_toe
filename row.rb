class Row
	attr_accessor :squares
	def initialize
		@squares = []
	end

	def occupied?
		@squares.size >= 3
	end

	def occupied_by_same_user?
		return false unless occupied?
		return @squares.all?{|square| square.input == :x  } || 
				@squares.all?{|square| square.input == :o  }
	end
	
	def occupied_by
		if occupied_by_same_user?
			return :x if @squares.all?{|square| square.input = :x  }
			return :o if @squares.all?{|square| square.input = :o  }
		else
			 "Nobody"
		end
	end
end