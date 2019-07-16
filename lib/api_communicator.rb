require 'rest-client'
require 'json'
require 'pry'

def get_character_movie_URLs_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  chosen_character = response_hash["results"].select do |character_hash|
    character_hash["name"].downcase == character_name
  end
  chosen_character[0]["films"]
end

def collect_film_info(film_URL_array)
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  film_URL_array.map { |film_URL|
    response_string = RestClient.get(film_URL)
    response_hash = JSON.parse(response_string)
    
  }
  # binding.pry
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.map { |film|
    p film["title"]
  }
end

def show_character_movies(character)
  films = get_character_movie_URLs_from_api (character)
  film_info = collect_film_info(films)
  print_movies(film_info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?


# # test run method
# film_URLs_array = get_character_movie_URLs_from_api("luke skywalker")
# film_info =  collect_film_info(film_URLs_array)
# print_movies(film_info)