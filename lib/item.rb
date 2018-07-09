require 'item/crud'
require 'dotenv'
# Module ini melakukan program crud sederhana
# yang dilakukan terhadap tabel item. Library
# Crud digunakan sebagai wrapper database.
module Item
  Dotenv.load('.env')
  if (ENV['ENVIRONMENT'] != "production")
    puts ".env.#{ENV['ENVIRONMENT']}"
    Dotenv.overload(".env.#{ENV['ENVIRONMENT']}")
  end
  # Mendapatkan nama item dari ID item tersebut
  def self.get(id)
    item = Crud.get(id)
  end

  # Memasukan barang baru kedalam database
  def self.create(name)
    item = Crud.create(name)
  end

  # Mengganti nama item berdasarkan ID item
  def self.update(id, name)
    item = Crud.update(id, name)
  end

  # Menghapus sebuah item berdasarkan ID
  def self.delete(id)
    status = Crud.delete(id)
  end
end
