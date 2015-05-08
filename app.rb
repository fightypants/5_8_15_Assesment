require('sinatra')
require('sinatra/reloader')
require('./lib/clients')
require('./lib/stylists')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  @stylists = Stylists.all()
  erb(:index)
end

get('/clients') do
  @clients = Clients.all()
  @stylists = Stylists.all()
  erb(:clients)
end


get('/stylists') do
  @stylists = Stylists.all()
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylists.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylists.all()
  erb(:stylists)
end
