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

post('/clients') do
  @stylists = Stylists.all()
  name = params.fetch('name')
  client = Clients.new({:name => name, :id => nil, :stylist_id => 0})
  client.save()
  @clients = Clients.all()
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

get('/stylists/:id') do
  @stylists = Stylists.find(params.fetch('id').to_i())
  @clients = Clients.all()
  erb(:stylists_info)
end

patch('/stylists/:id') do
  @stylists = Stylists.find(params.fetch('id').to_i())
  # stuck here, cannot associate client with stylist
end
