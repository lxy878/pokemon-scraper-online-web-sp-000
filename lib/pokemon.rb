class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    new_pokemon = Pokemon.new(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES (?,?)
    SQL
    DB[:conn].execute(sql, new_pokemon.name, new_pokemon.type)
    new_pokemon.id = 
  end

  def self.find

  end

end
