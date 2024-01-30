# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Create a new hash of the balances 
balances = Hash.new(0)

puts balances

# Calculate balances

# blockchain.each will iterated over each element in the blockchain array (square brackets)
# do |transaction| indicates that for each element in the blockhain array
# , we are assigning the current element to the variables "transaction",
# and then executing the code block that follows

blockchain.each do |transaction|
  from_user = transaction["from_user"]
  to_user = transaction["to_user"]
  amount = transaction["amount"]

  # Subtract amount from sender's balance if applicable

  # balances[from_user] accesses the current blance associated with from_user in the balances hash
  # if there's not existing balance for from_user, Ruby initializes it to 0
  # if from_user is not nil, if it is nil the line is skipped
  balances[from_user] = balances[from_user] -  amount  if from_user

  # Add amount to receiver's balance

  #balances[to_user] accesses the current balance associated with the "to_user" in the balances hash
  # if there's no existing balance, it's set to 0
  balances[to_user] = balances[to_user] + amount
end

puts balances 

# Print balances
balances.each do |user, balance|
  puts "#{user.capitalize}'s KelloggCoin balance is #{balance}"
end
