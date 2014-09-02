require './square.rb'

module GameRules
	attr_accessor :squares
	def initialize i = 1
		@squares = []
		i.times { |i| @squares[i] = Square.new } unless i>3
	end

	def occupied?
		@squares.all?{|square| square.input == :x || square.input == :o}
	end

	def occupied_by_same_user?
		return false unless occupied?
		return @squares.all?{|square| square.input == :x  } || 
				@squares.all?{|square| square.input == :o  }
	end
	
	def occupied_by
		if occupied_by_same_user?
			return :x if @squares.all?{|square| square.input == :x  }
			return :o if @squares.all?{|square| square.input == :o  }
		else
			 "Nobody"
		end
	end
end

class Row
	include GameRules
end

class Column
	include GameRules
end

class Diagnol
	include GameRules
end 