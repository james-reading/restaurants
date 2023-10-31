# README

## Installation

Clone the project

```
git clone git@github.com:james-reading/restaurants.git
```

We are using some of the same ports, so make sure you docker down first

```
platform-compose down
```


Then navigate to the cloned project directory and docker up

```
cd restaurants

docker compose up
```

Wait a few moments for Elasticsearch to boot up, then we need to create our index and ingest the data:

Open an IRB console

```
docker exec -it restaurants-web-1 irb
```

And set up the index
```
irb> require_relative "lib/ingester"
irb> Ingester.new.reset
```

Finally, navigate to `http://localhost:4567`

## Challenges

Currently, no matter what you search for, every single restaurant is returned in the results. Let's try and make it better

How many challenges can you complete? (In no particular order)

### I can search for restaurant names - 5 points

A search for the word "bakery" returns restaurants with "bakery" in the name

### I can search by name, description, or menu items - 10 points

A search for "Pho" should return results with "Pho" in the name, or on the menu, or in the description. (p.s. I'm not sure such a restaurant exists)

### Restaurant names are boosted - 5 points

I can search by name, description, or menu items. But restaurants that contain the search term in
their name are boosted to the top.

### Fuzzy matching on restaurant name - 5 points

A search with a typo such as "bakety" will return results with "bakery" in the name

### I can filter by minimum rating - 10 points

When selecting a minimum rating, e.g. "4+" I should only see results with a rating of 5 or higher.


### I can filter by type - 10 points

When selecting one or more types, the results are filtered by these types.

### I can search by partial matches - 20 points

A search for the incomplete word "bak" returns restaurants with "bakery" in the name


### I can filter by geo location - 50 points

You will need to create the frontend component for this! Add a filter to be able to filter restaurants to X miles within your current location.
