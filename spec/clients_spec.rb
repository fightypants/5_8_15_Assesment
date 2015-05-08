require('spec_helper')

describe('Clients') do
  describe('#name') do
    it('returns clients name') do
      new_client = Clients.new({:name => "Stacy"})
      expect(new_client.name()).to(eq("Stacy"))
    end
  end
end
