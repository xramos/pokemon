# Pokemon

### Description
 
You wake up one day deciding about starting a new career as a Pokemon trainer. After days of thinking of how you are going to organize the Pokemons you find on your way, you decide that none of the solutions available are going to help you, so you decide to create your own.

The app that you are going to create called **WefoxPokedex** has these requirements:
- The app is meant to be for personal use, but no account nor registration is needed. The app shows the backpack of a Pokemon trainer when he or she starts.
- The app can search for Pokemons. To search use the **Pokeapi v2** (https://pokeapi.co/). In this API, there is a method to retrieve a Pokemon based on its *id*. Don't spend too much time looking in the API documentation for this method, it's on the front page of the website as an example. To search for a Pokemon, you must always generate a random number between 1 and 1000 that will represent the Pokemon's *id* that is going to be sent to the API call.
- Once you find a Pokemon, the app should show it on screen, and offer the user two options: catch it (Throw a Pokeball, yes!) or leave it. You should not be able to catch the same Pokemon more than once (you gotta catch them all! but only 1 same Pokemon), so if a previously caught Pokemon appears the option to catch it should be hidden and the app should inform the user that the current Pokemon found has already been caught. The details you have to show in this screen are the following:
    - The *name* as text
    - The *sprites/front_default* as image
    - The *weight* as text
    - The *height* as text
- If you catch it throwing a Pokeball (animations aren't required!), then the app should add it to your backpack. If you leave the Pokemon, the app should cancel the search.
- The backpack is a collection of caught Pokemons. Every time a Pokemon is added to your backpack it will be there forever. You should be able to recover your Pokemons anytime you start the app. The app displays the Pokemons in the backpack as a list and every element should contain the *name* and the *sprites/front_default* of the Pokemon. The Pokemons in your backpack should be sorted by the key returned by the API called order. As there are many Pokemons, think of a design that can fit as many Pokemons as possible on screen.
- You can see the details of any Pokemon by tapping on the Pokemon in your backpack. The detail view of a Pokemon should contain the following information:
   - The *name* as text
   - The *sprintes/front_default* as image
   - The date and time when the Pokemon was catched
   - The *weight* as text
   - The *height* as text
   - The *base_experience* as text
   - The types of the Pokemon (can be found in the object path: */types/{typeNumber}/type/name*)
