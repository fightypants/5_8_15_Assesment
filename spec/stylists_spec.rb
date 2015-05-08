require('spec_helper')

describe('Stylists') do
  describe('#name') do
    it('returns stylists name') do
      new_stylist = Stylists.new({:name => "Stacy"})
      expect(new_stylist.name()).to(eq("Stacy"))
    end
  end

  describe('.all') do
    it('initially returns a blank array for stlylist') do
      expect(Stylists.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a stylist object to the stlylists table') do
      new_stylist = Stylists.new({:name => "billy"})
      new_stylist.save()
      expect(Stylists.all()).to(eq([new_stylist]))
    end
  end

  describe('.find') do
    it('will find the stylist using the id') do
      new_stylist = Stylists.new({:name => "Kha"})
      new_stylist.save()
      new_stylist2 = Stylists.new({:name => "Stacy"})
      new_stylist2.save()
      expect(Stylists.find(new_stylist2.id())).to(eq(new_stylist2))
    end
  end

  describe('#update') do
    it('will update the name of the stylist') do
      new_stylist = Stylists.new({:name => "Kha"})
      new_stylist.save()
      new_stylist.update({:name => "Pratt"})
      expect(new_stylist.name()).to(eq("Pratt"))
    end
  end

  describe('#delete') do
    it('will delete a stylist') do
      new_stylist = Stylists.new({:name => "Kha"})
      new_stylist.save()
      new_stylist2 = Stylists.new({:name => "Pratt"})
      new_stylist2.save()
      new_stylist.delete()
      expect(Stylists.all()).to(eq([new_stylist2]))
    end
  end
end
