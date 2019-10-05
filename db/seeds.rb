require 'faker'
Faker::Config.random = Random.new(42)

# Create testing accounts
accounts = []
for x in 1..3 do
  account_name = Faker::Bank.name
  balance = 50 + Random.rand(200)
  account = Account.create(name: account_name, balance: balance)
  accounts.push(account)
end

# Create random categories and subcategories
categories = []
subcategories = []
for x in 1..5 do
  categorie_name = Faker::Commerce.department
  categorie = Category.create(name: categorie_name)
  categories.push(categorie)

  categories.each do |category|
    for x in 1..4 do
      subcategory_name = Faker::Commerce.product_name
      budget = 50 + Random.rand(200)
      subcategory = SubCategory.create(name: subcategory_name, budget: budget)
      subcategory.category = category
      subcategory.save
      subcategories.push(subcategory)
    end
  end
end

# Create random transactions
transactions = []
for x in 1..10 do
  subcategories.each do |subcategory|
    description = Faker::Lorem.sentence
    if (x.odd?)
      inflow = 5 + Random.rand(55)
      outflow = 0
    else
      inflow = 0
      outflow = 5 + Random.rand(55)
    end
    transaction = Transaction.create(description: description, inflow: inflow, outflow: outflow)
    transaction.sub_category = subcategory
    transaction.account = accounts[x%3]
    transaction.save
  end
end