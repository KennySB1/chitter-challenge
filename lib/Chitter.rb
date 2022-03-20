require 'pg'

class Chitter


  def self.peeps(production_db = 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect( dbname: production_db)
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| Peep.new(id: peep['id'], content: peep['content'], date_made: peep['date_made'], sender_username: peep['sender_username'])}
  end

end
