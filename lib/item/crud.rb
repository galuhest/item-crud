require "item/crud/version"
require 'mysql'


module Item
	# Module ini adalah bagian dari module Item
	# yang bertujuan untuk bertindak sebagai wrapper
	# terhadap database
	module Crud

		# Membuat koneksi terhadap database
		def self.connect
		    #my = Mysql.new(hostname, username, password, databasename)  
		    connection = Mysql.new('localhost', 'root', 'root', 'onboarding')
		end

		# Menghapus sebubah koneksi database
		def self.close_connection(connection)
			connection.close
		end

		# Melakukan query terhadap database untuk mendapatkan
		# nama item berdasarkan id.
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

		# Melakukan query untuk memasukkan item kedalam database.
		# Function mengembalikan 2 hal, yaitu status dan id dari item tersebut.
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

		# Melakukan query terhadap database untuk mengganti nama sebuah item
		# berdasarkan id. Function ini mengembalikan status dari operasi ini.
		def self.update(id, name)
			connection = connect()
			query = connection.query("update item set name = \'#{name}\' where id = #{id[0].to_i}")
			close_connection(connection)
			status = "OK"
		end

		# Melakukan query terhadap database untuk menghapus sebuah barang
		# berdasarkan id. Function ini akan mengembalikan status dari operasi.
		def self.delete(id)
			connection = connect()
			query = connection.query("delete from item where id = #{id[0].to_i}")
			close_connection(connection)
			status = "OK"
		end
	end
end
