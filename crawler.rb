require 'httparty'

class Pokemon
  attr_accessor :name, :height, :weight, :types
  
  def initialize(name, height, weight, types)
    @name = name
    @height = height
    @weight = weight
    @types = types.map { |type| type['type']['name']}
  end
end

url = "https://pokeapi.co/api/v2/pokemon"

response = HTTParty.get(url)

if response.success?
  data = response.parsed_response

  pokemons = []

  data['results'].each do |pokemon|
    url_response = HTTParty.get(pokemon['url'])

    if url_response.success?

      poke_data = url_response.parsed_response

      poke_objc = Pokemon.new(poke_data['name'], poke_data['height'], poke_data['weight'], poke_data['types'])

      pokemons << poke_objc
    else
      puts "Erro ao obter dados da URL #{pokemon['url']}"
    end
  end

  pokemons.each do |pokemon|
    pokemon_hash = {
      name: pokemon.name,
      height: pokemon.height,
      weight: pokemon.weight,
      types: pokemon.types
    }

    puts JSON.pretty_generate(pokemon_hash)
  end
else
  puts "Erro na chamada da API. Código de status: #{response.code}"
  puts "Resposta da API: #{response.body}"
end