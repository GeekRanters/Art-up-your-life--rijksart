The web app is deployed here: https://arcane-river-12389.herokuapp.com/

The original wireframes can be consulted here: https://balsamiq.cloud/sp1tm/ptm3t and another design documentation is captured in this Google doc: https://docs.google.com/spreadsheets/d/1qyk9XfeILVY0Y1aKiV2Dg6QMJGDfVteD-9-69ww71TI/edit?usp=sharing.

The rijksart web app was built as my second project in General Assembly's Web Development Immersive.

The **technical requirements** are listed below:

**Have at _least_ 2 models** (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app
**Include sign up/log in functionality**, with encrypted passwords & an authorization flow
**Have complete RESTful routes** for at least one of your resources with GET, POST, PUT, PATCH, and DELETE
**Utilize SQL or an ORM to create a database table structure** and interact with your relationally-stored data
**Include wireframes** that you designed during the planning process
Have **semantically clean HTML and CSS**
**Be deployed online** and accessible to the public

All of the requirements are met. I haven't used a PATCH or PUT route since it did not make sense for the app's current functionality.

**DESCRIPTION OF THE RIJKSART APP**

The Rijksmuseum in Amsterdam has an impressive art collection which is made available in digital form. The Rijksart app enables users to browse the collection, and find high-res images of pieces of art.
These art objects can then be tagged with print ideas - and it's also possible to browse the art objects that have been tagged previously by other users.
When a user logs in, they'll be able to add art objects to their own favourites collection. They can also easily remove art objects from their collection.

**TECHNOLOGIES, LIBRARIES, FRAMEWORKS, TOOLS USED**

* PostgreSQL to build the database
* Sinatra to run the web app
* Ruby to manipulate the JSON response objects
* Ruby gems:
  * Active Record to build the ORM (Object Relational Model)
  * HTTParty to parse the JSON response objects
  * Pry for the occasional troubleshooting

* Balsamiq to create the wireframes
* Google Docs to document the database model, requirements and constraints

**CHALLENGES**

**broken API** The original idea was to display thumbnail images of every search result - something that should be easily feasible according to the API documentation. Unfortunately for me I later learned there is a known issue where image_urls are not included in the response, and the Rijksmuseum server generated an error when I made too many requests in my workaround solution.

**building the database in PSQL** During the project I created and dropped tables (and databases!) like a mad woman. Every time I realised I had to add a column or add or remove constraints on them, I had to recreate the table and then add meaningful data to them.

**understanding the power of Active Record** At first I thought I simply had to recreate all of my PSQL tables in Active Record, not fully understanding the semantics for creating relations between my tables. That's still visible in the code, especially in the beginning of the main.rb file.

**prettyfying the interface** Not really a challenge, but something I didn't achieve in a way I originally designed. I made the decision to focus on functionality first. I'm hopeful the Rijksmuseum will fix their API soon, so I can clean up the code on my side and add a more stylish CSS.  
