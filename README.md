# PrologCookbook
Digital cookbook in Prolog

# Authors (Patrick, Pardis)
# What is the problem?

We will attempt to use Prolog to create a digital cookbook that takes a list of ingredients in the user's pantry and returns the list of recipes they can make from a cookbook we use. We plan on using Prolog's natural language processing powers and logic programming paradigm to create a database of recipes and allow user's to add and remove ingredients from their pantry as it is used up.

# What is the something extra?

We also used Prolog's reification capabilities to create triples that could easily be indexed by a user depending on their dietary restrictions. This allows a recipe to have multiple different attributes without being stored in an overly complex predicate, and allows for customization for scaling up or narrowing down a recipe based on the needs of the user. We also used Prolog's list processing and natural language processing features to create an interactive query environment for the user that is simple and easy to use.

# What did we learn from doing this?

Prolog is a very suitable language for creating a recommender system such as the one we have implemented in this project. It is able to efficiently index and search over a large database once given the rules necessary for searching through the database. Although originally we intended to follow along with the natural language processing template using relations as demonstrated in class, we discovered that it was much easier to program specific queries that the user had to follow to get our program to retrieve the required information as this was much less error-prone and suitable for our narrow problem domain. The natural language processing in Prolog is quite primitive, so any misspellings causes false to be returned. This is especially problematic for debugging, as it is unclear whether false is returned because of an error in our program or because of an error in user input. Prolog also doesn't support the 'do' capabilities of a language like Haskell, so the interaction loop must be manually restarted each time the user wants to begin a new query, which is mildly annoying. As a learning experience however, it was interesting to watch how Prolog's backtracking capabilities can very quickly take care of programs whose main functionality is performing search. 
