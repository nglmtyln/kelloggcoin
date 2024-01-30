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

# 👇👇👇 Your code HERE 👇👇👇

# Create a new hash of the balances, if it doesn't have a value it sets it to 0
# the hash created outside the loop will exist outside the loop and be updated 
balances = Hash.new(0)

# array.each iterates over each element in the array
# do |element| end defines a block of code that will be executed for each element in the array

blockchain.each do |transaction|
  from_user = transaction["from_user"]
  to_user = transaction["to_user"]
  amount = transaction["amount"]

  # Subtract amount from sender's balance if applicable
  
  # if from_user translates to if from_user is not nil
  # if it is nil, it would just skip this code
  if from_user
     balances[from_user] = balances[from_user] -  amount 
  end

  # Add amount to receiver's balance

  # balances[to_user] pulls the value associated with transaction["to_user"] in the given element/key, e.g. ben
  # if ben didn't exist as a key in balances, it would create a new key for ben and set the value to 0
  # then it references the value of balances["ben"] = 0 + amount
  balances[to_user] = balances[to_user] + amount

end

puts balances 

# Print balances
balances.each do |user, balance|
  puts "#{user.capitalize}'s KelloggCoin balance is #{balance}"
end
