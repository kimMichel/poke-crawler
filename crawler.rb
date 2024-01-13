require 'httparty'

url = "https://pokeapi.co/api/v2/pokemon"

response = HTTParty.get(url)

if response.success?
  data = response.parsed_response

  puts "Dados da API: #{data}"
else
  puts "Erro na chamada da API. Código de status: #{response.code}"
  puts "Resposta da API: #{response.body}"
end