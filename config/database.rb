MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'padrinojasmine_development'
  when :production  then MongoMapper.database = 'padrinojasmine_production'
  when :test        then MongoMapper.database = 'padrinojasmine_test'
end
