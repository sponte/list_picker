require "list_picker/version"

module ListPicker

  class Picker
  	def initialize(array, options = {})
  		@options = {
  			label_method: :to_s
  			}.merge(options)

  			@array = array
  		end

  		def ask(question, &validation_block)
  			puts ""
  			puts "#{question}: "
  			puts ""
  			@array.each_with_index do |item, index|
  				puts "#{(index + 1).to_s.rjust(2)}) #{item.send(@options[:label_method].to_sym)}"
			end
			puts ""
			print "> "

			default_validation_block = Proc.new do |item|
				item.to_i > 0 && item.to_i <= @array.size
			end

			if preselected_option = ARGV.shift
				input = preselected_option
			else
				input = gets.chomp
			end

			unless block_given?
				validation_block = default_validation_block
			end

			unless validation_block.call(input)
				$stderr.puts ""
				$stderr.puts "Invalid selection, please try again"
				return ask(question, &validation_block)
			end

			selected = @array[input.to_i - 1]

			puts ""
			puts "Selected item: #{selected.send(@options[:label_method].to_sym)}"
			puts ""

			return selected
		end
	end
end
