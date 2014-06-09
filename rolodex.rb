
#This class is necessary to store all the contact 
class Rolodex

	def initialize 
		@contact_array = []
		@index =0
	end

	def add_contact(contact)
		contact.id=@index
		@contact_array << contact
		print_contact
		@index += 1
	end 

	def print_contact
		@contact_array.each {|i|i.print_rolo}
	end

	def is_in_list(an_id)
			@contact_array.each do |i|
			if i.id == an_id then
				puts "Found"
				return true
			end
		end
		return false 
	end
	
	def get_contact_by_id(an_id)
			@contact_array.each do |i|
				if i.id == an_id then
					return i
				end
			end
	end

	def modify_attr(an_id,an_attribute,a_new_value)
		case an_attribute
		when 1 then get_contact_by_id(an_id).first_name = a_new_value 
		when 2 then get_contact_by_id(an_id).last_name=a_new_value
		when 3 then get_contact_by_id(an_id).email = a_new_value
		when 4 then get_contact_by_id(an_id).note = a_new_value
		when 5 then get_contact_by_id(an_id).id = a_new_value
		end
		print_contact
	end

	def delete_account(an_id)
		k=0
		@contact_array.each do |i|
			if i.id == an_id 
				@contact_array.delete_at(k)
				return
			else
				puts "Contact not found"
			end
			k+=1
		end
	end

	def display_attr(id,attribute)
		puts id.class
		contact1 = get_contact_by_id(id)
		puts contact1.class
		case attribute
		when 1 then return puts contact1.first_name
		when 2 then return contact1.last_name
		when 3 then return contact1.email
		when 4 then return contact1.note
		when 5 then return contact1.id
		end
	end
end