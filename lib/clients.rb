class Clients
  attr_reader(:name,:id,:stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
    @stylist_id = attributes[:stylist_id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
end

  define_singleton_method(:all) do
    clients_list = []
    all_clients = DB.exec("SELECT * FROM clients")
    all_clients.each do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i()
      stylist_id = client.fetch('stylist_id').to_i()
      clients_list.push(Clients.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients_list
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

  define_singleton_method(:find) do |identification|
    found_client = nil
    Clients.all().each() do |client|
      if client.id() == identification
        found_client = client
      end
    end
    found_client
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    DB.exec("UPDATE clients SET name = ('#{@name}') WHERE id = #{@id};")
    DB.exec("UPDATE clients SET stylist_id = ('#{@stylist_id}') WHERE id = #{@id};")
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end
end
