class User < ApplicationRecord

  #1 - Write a function that finds all users with disallowed usernames.
  def self.find_all_disallowed_users
      User.joins('INNER JOIN disallowed_usernames ON users.username = disallowed_usernames.invalid_username')
  end

  #2- Write a function that resolves all username collisions.
  def self.update_duplicate_usernames(optional = "update database")
      User.filter_out_first_uniq_of_each_dup.each do |user|
        @user = User.find(user["id"])
        @user.update_username(optional)
      end
  end

  #3- Write a function that resolves all disallowed usernames.
  def self.resolve_disallowed_usernames(optional = "update database")
    User.find_all_disallowed_users.each do |user|
      @user = User.find(user["id"])
      @user.update_username(optional)
    end
  end

  #Queries records of all duplicate usernames and creates an addition column called row that paritions by username and assigns an ordering value based on database creation
  def self.duplicated_users_table_partitioned_username_asc_ord
    sql = <<-SQL
    select
     users.id, username, ROW_NUMBER() OVER(PARTITION BY username ORDER BY users.id ASC)
        as row
    from users
    join (select username, count(*) as quantity
    from users
    group by username
    having "quantity" > 1) using(username)
      SQL

    duplicated_user_partitioned = ActiveRecord::Base.connection.execute(sql)
  end

  #Removes first duplicate of each distinct username from duplicate tables (first dup will not have to be changed)
  def self.filter_out_first_uniq_of_each_dup
    User.duplicated_users_table_partitioned_username_asc_ord.select{ |user| user["row"] != 1 }
  end

  #Updates all duplicates that need to be changed
  def update_username(optional)
    username = self.username
    name = username.tr("0-9", "")
    num = username.scan(/\d+/).join.to_i + 1

    #Adds 1 to username and checks to see if the username exists in the database
    #If username exists continue to add 1 to username
    while User.find_by(username: name + num.to_s) do
       num += 1
    end

    #When username is new to the database, either update or print depending on optional parameter
    if optional == "dry run"
      p self
    else
      self.update(username: name + num.to_s)
    end
  end

end
