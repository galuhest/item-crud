require "item/crud/version"
require 'mysql'

module Item
	module Crud
		def self.connect
		    #my = Mysql.new(hostname, username, password, databasename)  
		    connection = Mysql.new('localhost', 'root', 'root', 'onboarding')
		end

		def self.close_connection(connection)
			connection.close
		end

		def self.get(id)
			connection = connect()
			id = id[0].to_i
			query = connection.query("select * from item where id = #{id}")
			name = ""
			query.each_hash do |row|
				name = row["name"]
			end
			close_connection(connection)
			name
		end

		def self.create(name) 
			connection = connect()
			item = connection.query("insert into item (name) values (\'#{name}\')")
			query = connection.query('SELECT LAST_INSERT_ID()') 
			id = -1
			query.each do |row|
				id = row
			end
			close_connection(connection)
			return "OK", id
		end

		def self.update(id, name)

		end

		def self.delete(id)

		end
	end
end
