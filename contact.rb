
#This class is necessary to group all the attribute per contact. 
class Contact 

	attr_accessor :first_name, :last_name, :email, :note, :id

	def initialize(first_name,last_name,email,note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	def print_rolo
		puts ""
		puts	"#{@first_name}  #{@last_name}  -  #{email}  :  #{note}  => #{@id}"
		puts ""
	end
end