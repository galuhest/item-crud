require 'item/crud'

module Item
	def self.get(id)
		item = Crud.get(id)
	end

	def self.create(name)
		status = Crud.create(name)
	end

	def self.update(id, name)
		status = Crud.update(id, name)
	end

	def self.delete(id)
		status = Crud.delete(id)
	end
end