require 'httparty'
require 'json'

class Pokemon
  attr_accessor :name, :height, :weight, :types
  
  def initialize(name, height, weight, types)
    @name = name
    @height = height
    @weight = weight
    @types = types.map { |type| type['type']['name']}
  end

  def to_json(*_args)
    {
      name: @name,
      height: @height,
      weight: @weight,
      types: @types,
      moves: @moves
    }.to_json
  end
end

url = "https://pokeapi.co/api/v2/pokemon"

pokemons = []

loop do
  
  puts "Executando chamada na url: #{url}"
  response = HTTParty.get(url)
  
  if response.success?
    data = response.parsed_response
  
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

    next_url = data['next']
    break if next_url.nil?

    url = next_url

  else
    puts "Erro na chamada da API. Código de status: #{response.code}"
    puts "Resposta da API: #{response.body}"
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

puts "#{pokemons.length} Pokemons crawleados."

# Exportar como json file

json_content = JSON.pretty_generate(pokemons)

File.open('pokemons.json', 'w') {|file| file.write(json_content)}

puts 'Arquivo JSON salvo com sucesso.'