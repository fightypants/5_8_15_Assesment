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



end
