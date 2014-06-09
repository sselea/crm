require_relative "contact"
require_relative "rolodex"

class Crm

	attr_reader :name

	 def self.run(name)
			crm = Crm.new(name)
			crm.main_menu
		end

	def initialize(name)
		@name = name
		@database=Rolodex.new
		puts "Welcome to #{name}" #you can do this because of the accessor 
	end

	def print_main_menu
		puts ""
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete an account"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts ""
	end

	def main_menu
		print_main_menu
		user_selected=gets.to_i
		call_option(user_selected)
	end 

	def call_option(user_selected)
		case user_selected
			when 1 then	add_new_contact 
			when 2 then	modify_existing_contact
			when 3 then delete_account
			when 4 then display_contacts
			when 5 then display_attribute
			when 6 then return
			else
				puts "Invalid option. Please try again"
				main_menu
		end
		main_menu unless user_selected == 6
	end

	def add_new_contact
		puts ""
		print "Enter First Name: "
		first_name = gets.chomp
		print "Enter Last Name: "
		last_name = gets.chomp
		print "Enter Email Address: "
		email = gets.chomp
		print "Enter a Note: "
		note=gets.chomp
		@database.add_contact(Contact.new(first_name,last_name,email,note))
	end

	def modify_existing_contact 
		selected_id = which_attr_to_display_modify
		if selected_id 
			attr_to_modify=gets.chomp.to_i
			puts ""
			puts "Please enter new value for the attribute"	
			puts ""
			new_value=gets.chomp.to_s
			@database.modify_attr(selected_id,attr_to_modify,new_value)
		else
			puts "Contact not found"
		end
		
	end

	def delete_account
		@database.print_contact
		print"Choose one contact by their id: "
		selected_id=gets.to_i
		found = @database.is_in_list(selected_id)
		if found
			@database.delete_account(selected_id)
			@database.print_contact
		else
			puts "Contact not found"
		end
	end

	def display_contacts
			@database.print_contact
	end

	def display_attribute
		selected_id=which_attr_to_display_modify
		if selected_id
			attr_to_display=gets.chomp.to_i
			puts @database.display_attr(selected_id,attr_to_display)
		end
	end

	def which_attr_to_display_modify
		@database.print_contact
		print"Choose one contact by their id: "
		selected_id=gets.to_i
		puts ""
		if @database.is_in_list(selected_id)
			puts ""
	 		puts "Which attribute do you want to diplay/change: "
			puts ""
			puts "[1] First Name"
			puts "[2] Last Name"
			puts "[3] Email"
			puts "[4] Notes"
			puts "[5] ID"
			puts ""
			return selected_id
		else
			puts "Contact not found"
		end

	end

end 

Crm.run("Bitmaker Labs CRM") # they got called on the class itself instead of on an instance
