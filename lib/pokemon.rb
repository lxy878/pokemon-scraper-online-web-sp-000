class Pokemon
  attr_accessor :name, :type, :id
  attr_reader :db
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
    db.execute(sql, new_pokemon.name, new_pokemon.type)
    new_pokemon.id = db.execute('SELECT last_insert_rowid() from pokemon')
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon_array = db.execute(sql, id)
    pokemon_array.collect {|data| Pokemon.new(data[0], data[1], data[2], db)}.first
  end

end
