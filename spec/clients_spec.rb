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

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

end
