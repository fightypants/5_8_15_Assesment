require('spec_helper')

describe('Clients') do
  describe('#name') do
    it('returns clients name') do
      new_client = Clients.new({:name => "Stacy"})
      expect(new_client.name()).to(eq("Stacy"))
    end
  end

  describe('.all') do
    it('initially returns a blank array for clients') do
      expect(Clients.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a clients object to the clients Database') do
      new_client = Clients.new({:name => "billy"})
      new_client.save()
      expect(Clients.all()).to(eq([new_client]))
    end
  end

  describe('.find') do
    it('will find the client using the id') do
      new_client = Clients.new({:name => "Kha"})
      new_client.save()
      new_client2 = Clients.new({:name => "Stacy"})
      new_client2.save()
      expect(Clients.find(new_client2.id())).to(eq(new_client2))
    end
  end



end
