class Stylists
  attr_reader(:name,:id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
end

  define_singleton_method(:all) do
    stylists_list = []
    all_stylists = DB.exec("SELECT * FROM stylists")
    all_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i()
      stylists_list.push(Stylists.new({:name => name, :id => id}))
    end
    stylists_list
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

  define_singleton_method(:find) do |identification|
    found_stylist = nil
    Stylists.all().each() do |stylist|
      if stylist.id() == identification
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = ('#{@name}') WHERE id = #{@id};")
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end
end
