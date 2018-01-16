The rijksart web app was built as my second project in General Assembly's Web Development Immersive.

The **technical requirements** are listed below:

**Have at _least_ 2 models** (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app
**Include sign up/log in functionality**, with encrypted passwords & an authorization flow
**Have complete RESTful routes** for at least one of your resources with GET, POST, PUT, PATCH, and DELETE
**Utilize SQL or an ORM to create a database table structure** and interact with your relationally-stored data
**Include wireframes** that you designed during the planning process
Have **semantically clean HTML and CSS**
**Be deployed online** and accessible to the public

**DESCRIPTION OF THE RIJKSART APP**

The Rijksmuseum in Amsterdam has an impressive art collection which is made available in digital form.
The Rijksart app enables users to browse the collection, and find high-res images of pieces of art.
These art objects can be tagged with rooms in the home a reprint would look great in - and it's also possible to browse the art objects that have been tagged previously by other users.
When a user logs in, they'll be able to add art objects to their own favourites collection.

**TECHNOLOGIES, LIBRARIES, FRAMEWORKS USED**

* PostgreSQL to build the database
* Sinatra to run the web app
* Ruby to manipulate the JSON response objects

* Balsamiq to create the wireframes
* Google Docs to document the database model, requirements and constraints

**CHALLENGES**

The original idea was to display thumbnail images of every search result - something that should be easily feasible according to the API documentation. Unfortunately for me I later learned there is a known issue where image_urls are not included in the response, and the Rijksmuseum server generated an error when I made too many requests in my workaround solution. 
