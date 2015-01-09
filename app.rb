require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/numword')

get('/') do
  erb(:form)
end

get('/numword') do

  erb(:numword)
end
