# Create a class for Accounts

class Account
	attr_accessor :name, :balance
	attr_reader :account

	def initialize(name, balance, account)
		@name = name
		@account = account
		@balance = balance
	end

	def add_funds(amount)
		@balance += amount
	end

	def withdraw_funds(amount)
		# checks if the amount being taken is less than available
		if @balance < amount
			puts "Insufficient funds! Choose a smaller amount!"
		else
			@balance -= amount
			puts "Your withdrawal of#{amount}has been made. Your new balance is #{@balance}"
		end
	end


end


# This is the menu for the main screen


def main_menu
	puts "Welcome to Roy Bank!"
	puts"Please make a selection:"
	puts "____________________________"
	puts "1. Create a new account"
	puts "2. View Account Information"
	puts "3. Exit Program"

print "Option: "

option = gets.chomp.to_i

if option == 1
	create_account
	main_menu
	elsif option == 2
		# some code here
		#user_login
		account_menu
	elsif option == 3
		puts "Thank you for stopping by!"
	else 
		puts "Invalid entry! Please choose from the available options!"

		main_menu

	end
			
		




end

def create_account
	puts "Please enter a name:"
	name = gets.chomp.upcase
	print "Enter a starting balance: "
	balance = gets.chomp.to_f
	acct_num = @accounts.length + 1
	new_account = Account.new(name, balance, acct_num)
	@accounts.push(new_account)
	
	@accounts.each do |a|
		if a.name == name && a.account == acct_num


			puts "Account has been created:"
			puts "Name: #{name}"
			puts "Account No: #{acct_num}"
			puts "Balance: #{balance}"
			puts "Please make a note of this information."

		end

	end



end

def account_menu
	balance = 0
	found = false
	puts "\n"
	puts "Welcome to the Account Menu. Please login."
	print "Name: "
	name = gets.chomp.upcase
	print "Account Number: "
	acct_num = gets.chomp.to_i

	@accounts.each do |a|
		if a.name == name && a.account == acct_num 
			balance = a.balance
			found = true
		end
	end
	if found == true #account is found, move on to view_account
		view_account(name,acct_num,balance)
		elsif @count < 2
		 	@count +=1
			puts "Account not found, please try again"
			puts "Attempts left: #{3 - @count}"
			account_menu
		else
			puts "Sorry, account not found. Plese contact customer service."
			main_menu
		end
	end

	def view_account(name,acct_num,balance)

		puts "\n"
		puts "Welcome to Your Account#{name}"
		puts "Choose from the following options: "
		puts "____________________________"
		puts "1. View Account Balance"
		puts "2. Make A Deposit"
		puts "3. Make A Withdrawal"
		puts "4. Back to Main Menu"

		choice = gets.chomp.to_i

		if choice == 1
			view_balance(name,acct_num,balance)
		elsif choice == 2
			make_deposit(name,acct_num)
		elsif choice == 3
			make_withdrawal(name,acct_num)
		elsif choice == 4
			main_menu
		else 
			puts "Invalid entry!"
			view_account(name, acct_num)
			
	end
end

def view_balance(name,acct_num,balance)

	puts "Your current balance for account number #{acct_num} is $#{balance}"
	view_account(name,acct_num,balance)
	end

	def make_deposit(name,acct_num)
		balance = 0
		puts "How much would you like to deposit?"
		amount = gets.chomp.to_f
		
		@accounts.each do |a|
		if a.name == name && a.account == acct_num 
			a.add_funds(amount)
			balance = a.balance
			puts "Your deposit of #{amount} has been made. Your new balance is $#{a.balance}."
		end
	end
	view_account(name, acct_num, balance)
end

def make_withdrawal(name,acct_num)
	balance = 0
	puts "How much would you like to withdraw?"
	amount = gets.chomp.to_f

	@accounts.each do |a|
		if a.name == name && a.account == acct_num
			a.withdraw_funds(amount)
			balance = a.balance
			puts "Your withdrawal of #{amount} has been made. Your new balance is $#{balance}"

		end

	end
	view_account(name,acct_num,balance)
end

			

				

	

# -------------------Main Program ---------->


	@count = 0
	@accounts = []








main_menu

