require 'rest-client'
require 'json'
require 'pry'

def get_character_info(response_hash, character_name)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  response_hash["results"].find do |character|
    character["name"].downcase == character_name.downcase
  end  
end

def get_JSON_response(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  #response_hash
end

def get_character_movies_from_api(character_name)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  #response_hash = JSON.parse(response_string)
  response_hash = get_JSON_response('http://www.swapi.co/api/people/')
  character_info = get_character_info(response_hash, character_name)
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  info = character_info["films"]
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def get_movie_info(url)
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film

  #response_string = RestClient.get(url)
  #return title instead 
  #response = JSON.parse(response_string)["title"]
  get_JSON_response(url)["title"]
end

def print_movies(film_urls)
  # some iteration magic and puts out the movies in a nice list
  film_urls.each_with_index do |film_url, index|
      puts "#{index+=1} #{get_movie_info(film_url)}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
