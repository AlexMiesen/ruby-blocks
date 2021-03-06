
class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end

  def transactionally
    begin_transaction
    yield
    commit_transaction
  rescue Exception => e
    rollback_transaction
  end
  
  def begin_transaction
    puts "Beginning transaction..."
  end
  
  def commit_transaction
    puts "Committed transaction."
  end
  
  def rollback_transaction
    puts "Rolled back transaction!"
  end
  

	def self.open(database, admin, password)
		driver = DatabaseDriver.new(database, admin, password)
		driver.connect

		return driver unless block_given?

		begin
			yield(driver)
		ensure
			driver.disconnect
		end 

	end 

end

# driver = DatabaseDriver.new("my_database", "admin", "secret")

# driver.connect
# driver.execute("SELECT * FROM ORDERS")
# driver.execute("SELECT * FROM USERS")
# driver.disconnect

# puts "New code below"

# DatabaseDriver.open("my_database", "admin", "secret") do |driver|
#   driver.execute("SELECT * FROM ORDERS")
#   driver.execute("SELECT * FROM USERS")
# end

# puts "raised error below"

# DatabaseDriver.open("my_database", "admin", "secret") do |driver|
#   driver.execute("DELETE * FROM ORDERS")
#   raise "Boom!"
#   driver.execute("DELETE * FROM USERS")
# end


puts "Bonus Part:"

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    raise "Boom!"
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end
end