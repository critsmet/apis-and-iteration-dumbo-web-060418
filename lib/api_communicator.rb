require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  names_and_movies = {}
  movies = []
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash["results"].each do |char|
  names_and_movies[char["name"]] = char["films"]
end
  movies = names_and_movies[character]
  # character_movies.each do
  # character_films = RestClient.get('http://www.swapi.co/api/people/')
  # character_hash = JSON.parse(all_characters)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
    movies

end

def parse_character_movies(films_hash, character)
   titles = []
   movies = get_character_movies_from_api(character)
   movies.each_with_index do |movie_link, i|
   movie_info = RestClient.get(movie_link)
   movie_hash = JSON.parse(movie_info)
   titles << "#{i += 1}. " + movie_hash["title"]
   end
   titles
end

character = "C-3PO"
films_hash = get_character_movies_from_api(character)
get_character_movies_from_api(character)
parse_character_movies(films_hash, character)



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
