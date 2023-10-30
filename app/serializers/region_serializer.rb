class RegionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :generation, :games, :pokedex_count

  has_many :pokemons
end
