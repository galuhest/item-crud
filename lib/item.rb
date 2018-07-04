require 'item/crud'
# Module ini melakukan program crud sederhana
# yang dilakukan terhadap tabel item. Library
# Crud digunakan sebagai wrapper database.
module Item
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
