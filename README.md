# GitGrub - 2-way marketplace

Link to the deployed app: https://gitgrubb.herokuapp.com/  <br>
Link to github repo: https://github.com/andrewtrandev/GitGrub

---
## Section 1: Requirement checklist 

Each time you have completed a requirement check it off the list. This way it will be easy for the educators as well as yourselves to track your progress.


- [X] 1. Create your app using Ruby on Rails.
- [X] 2. Use Postgresql database in development and production.
- [X] 3. My app has authentication (eg. Devise).
- [X] 4. My app has authorisation (i.e. users have restrictions on what they can see and edit).
- [X] 5. My app has some type of file (eg. images) uploading capability.
- [X] 6. My app is deployed to Heroku (recommended) or AWS.
- [X] 7. I have identified the problem I am trying to solve by building this particular marketplace app.
- [X] 8. I have explained why is it a problem that needs solving.
- [X] 9. I have provided a link (URL) to my deployed app (i.e. website)
- [X] 10. I have provided a link to my GitHub repository (repo). I have ensured the repo is accessible by my Educators.
- [X] 11. I have a complete description of my marketplace app (website), including:  
- [X] 11.1 Purpose  
- [X] 11.2 Functionality / features  
- [X] 11.3 Sitemap  
- [X] 11.4 Screenshots  
- [X] 11.5 Target audience  
- [X] 11.6 Tech stack (e.g. html, css, deployment platform, etc)  

- [X] 12. I have provided user stories for my app
- [X] 13. I have provided Wire-Frames for my app 
- [X] 14. I have provided an ERD for my app
- [X] 15. I have explained the different high-level components (abstractions) in my app
- [X] 16. I have listed and described any third party services that your app will use
- [X] 17. I have described my projects models in terms of the relationships (active record associations) they have with each other.
- [X] 18. I have discussed the database relations to be implemented in my application
- [X] 19. I have provided my database schema design
- [X] 20. I have described the way tasks are allocated and tracked in my project

NB Slide/Presentation specific requirements

- [X] 21. An outline of the problem I solved by building this particular marketplace app, and why it’s a problem that needs solving.
- [ ] 22. A well planned walkthrough of my app
- [ ] 23. I have practiced my presentation at least once and it is 5-6 minutes long. 


---

#### Purpose
The purpose of my marketplace is to connect cooks and users together and facilitate the exchange of food and currency between them.


#### Functionality / features  

- **User accounts** - 
Users can make accounts to access all the features of the website. Users can also edit their password or delete their account.

- **Listings** - 
Users that are not signed in can view the index and click to view listings but are restricted from purchasing meals.
Logged in users can create meal listings and edit them as needed. They can also attach pictures and an address for the listing.

- **Favorites** -
Logged in users can favorite meals by clicking the favorite link displayed when viewing a single meal. All favorites can be viewed from the navigation bar.

- **Secure Payment** -
Payments are handled by stripe, a well-known payment platform that accepts credit cards and google pay. 

- **Search** - 
Can search for foods by name

<br>

#### Sitemap  
Note the blue boxes/site pages can be accessed by anyone while yellow boxes can only be accessed by signed in users.
![sitemap](docs/sitemap.PNG)


#### Screenshots  

Home screen<br>

![screenshot home](docs/screenshots/SChome.png)

Login screen<br>
![screenshot login](docs/screenshots/SClogin.png)

Create listing screen<br>
![screenshot create listing](docs/screenshots/SCcreate.png)

Change password screen<br>
![screenshot change password](docs/screenshots/SCchangepw.png)

Home / Index of listings<br>
![screenshot index](docs/screenshots/SCindex.png)

Show individual listing screen<br>
![screenshot show listing](docs/screenshots/SCshow.png)

Favorites<br>
![screenshot favorites](docs/screenshots/SCfav.png)

#### Target audience  
The main audience are busy individuals and individuals seeking food that offers competitive pricing and healthier alternatives compared to traditional options.

#### Tech stack (e.g. html, css, deployment platform, etc)  
Application and Data
- Amazon S3
- Bulma
- CSS
- Heroku
- Html
- Javascript
- jQuery
- Postgresql
- Ruby
- Ruby on Rails

  
DevOps
- Git
- Github
- Visual Studio Code

Utilities
- Balsamiq Wireframes
- Devise
- Evernote
- Stripe
- Trello
- Ultrahook


---
### Rubric Criteria

## Section 2: Documentation
---
NB leave the Titles as they are and answer the questions below.

##### 1. Explain the different high-level components (abstractions) in your App.
* Precisely explains and shows understanding of the different high-level components of the app

---

GitGrub was built using Ruby on Rails and utilises the Postgresql database. Ruby on Rails relies on the MVC (Model, View, Controller) framework which divides the app into 3 distinct but connected parts. Rails has very specific naming conventions that it requires so that it can recognise and create links between the MVC framework.

The model, view, controlle and routes are high-level components of the app that interact to generate the various user interfaces for the client, handle and store data and deal with user requests. Explained below are the different high-level components:

The model, also known as ActiveRecord, primarily deals with persistent data and the manipulation of the database. The model makes use of associations and Object Relational Mapping to manipulate data as objects which allows us to interact with the database without having to write SQL. 
ActiveRecord also automatically generates Create, Read, Update, Delete (CRUD) methods for us to use on our models.

The view, also known as ActionView, is concerned with presentation of data to the user. It mainly uses Embedded Ruby (erb) files to display data. Views can access the instance variables of methods that are appropriately named, this allows Controllers to pass information to views so that they can be displayed to end users. Views should have very little logic and mainly have logic to render displays.

The Controller, also known as ActionController, handles requests from users and acts as a middle-man between the view and model by analysing requests and forwarding them to the model to fetch, update or save data and then returning that information to the user through the view. 

Routes are also another important part of the application that help direct incoming http requests to the appropriate controllers and actions. Rails has a router that processes the incoming HTTP methods and URL's, and then sends them to the appropriate controller and action.


---
##### 2. List and describe any 3rd party services.
* Includes a complete and detailed description of third party services used in the app
---

#### Devise
Use of Devise gem for user authentication and authorisation. The devise gem automatically generates a User model for us that we can use to assign unique accounts to. It allows us to generate a user and assign an email and password to. It can also generate the necessary views and routes for us to display login, sign up, edit password and forgot password pages.

#### Stripe
The Stripe gem was used to facilitate payments in GitGrub, it allows individuals and businesses to make payments online securely and quickly. 
Stripe has streamlined the process to add payment options to an app and also have security features such an enforced encryption, fraud detection and is Payment Card Industry Data Security Standards compliant (PCI DSS)- a security standard to reduce fraud and data breaches for customers.

#### Amazon S3
Amazon Simple Storage Service, or Amazon S3, provides storage for objects and is mainly used in my application for image uploading and cloud storage of images.

#### Bulma
Bulma is a css framework based on flexbox that I used for quickly applying styling to various components. 

#### Faker
Faker gem was used to generate fake seed data. This was used to test functionality of the models and provide visual feedback of how views would render.

#### Jquery-rails
Jquery-rails was added so that I could have the favorites button work dynamically without re-rendering the whole webpage.

#### Ransack
Ransack gem was used to create a simple search form on my front page.
Can be configured to search for various and multiple fields.

---
##### 3.1. Identify the problem you’re trying to solve by building this particular marketplace App?
* Demonstrates a full understanding of the problems that exist in a relevant marketplace that needs disrupting
---
The problem I'm trying to solve is the lack of options when it comes to meals. Options such as going out to eat at a restaurant during the coronavirus pandemic are not possible, considering most restaurants have shut or drastically reduced their open times and/or seating capacity. 
This leaves the options of cooking your own food or getting food delivered. Delivery options are expensive-for what you get and if it's not expensive than it's usually fast food which isn't particularly healthy.
GitGrub offers an alternative to fast food and the exorbitant pricing for a good meal.
GitGrub gives you access to the home cooking of anyone willing to place their food up for sale. 


---
##### 3.2 Why is the problem identified a problem that needs solving?
* Demonstrates a full understanding of the problems that exist in a relevant marketplace that needs disrupting
---

This problem needs solving as busy individuals and individuals looking for affordable and healthy meals are starved for options. 
By making an app to connect cooks and users we can open the market up to cooks,families and meal preppers that can take advantage of a unique time where most people are eating at home. The open market also allows for a more dynamic food environment where, naturally, food options are diversified, prices are competitive and higher-quality food is supported.


---
##### 4. Describe your project’s models in terms of the relationships (active record associations) they have with each other.
* Complete discussion of the project’s models with an understanding of how its active record associations function
---

```ruby
class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :lunches, dependent: :destroy
end
```
A User can have many lunches and many favorites. When a user deletes their account it will also consequently delete the favorites and lunches that reference the user as a foreign key.

```ruby
class Lunch < ApplicationRecord
    belongs_to :user
end
```

The Lunch model is used to store the associated data for a meal. It belongs to a User which means each Lunch item can only be associated and created by a single user, i.e A lunch item can not have many users associated with it.


```ruby
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :lunch
end
```

The Favorites model is used to attach a favorite to a specific lunch and  user. A Favorite belongs to a User and Lunch, the combination of both of these foreign keys act as a composite key to uniquely define a Favorite.
If a favorite only belonged to a user then there would be no reference to what lunch it would refer to and if a favorite only belonged to a lunch then it wouldn't be belong to any user. Hence why we need both values.


---
##### 5. Discuss the database relations to be implemented.
---
![erd mini sc](docs/dbrelations/erdrelations.PNG)
* Provides coherent discussion of the database relations, with reference to the ERD

---


With reference to the above ERD and specifically crow's feet, the following database relations will be implemented along with relevant discussion.

<br>

```
The relations to be implemented for the user table:
- users can have zero or many favorites
- users can have zero or many lunches
```

A user can create lunches and also favorite lunches to view later.
These relations have been assigned for the user model, as a user should be free to have no favorites/lunchs or many favorites/lunches.

<br>

```
The relations to be implemented for the lunch table:
- lunches can have zero or many favorites
- lunches can only belong to one user
```

Lunches are the listings that a user can create that detail the meal that they are selling. The relations for lunches are needed so that we can define a lunch as having only been created and belonging to one user. Lunches also can have favorites associated with them, so a particular lunch could have no users having favorited it or many.

<br>

```
The relations to be implemented for the favorites table:
- a favorite belongs to one user
- a favorite belongs to one lunch
```

The favorites tables has two foreign keys in the case of user_id and lunch_id. It uses both of these values as a composite key to uniquely define a favorite. 



The lunch model also has the 
```
-has one picture attached
```
![db relations for active storage](docs/dbrelations/activeERD.PNG)


The relation for this pertains to active_storage_attachments and active_storage_blobs which are used for active storage. 
"Active_storage_attachments" references "blob_id" as a foreign key from "active_storage_blobs."


---
##### 6. Provide your database schema design.
![image of ERD for reference](docs/ERD.png)
* Flawless, complex, complete, and well thought through ERDs provided
---

Ruby on rails by default creates the following for "Users", "Lunches" and "Favorites" <br>
I have omitted them from the schema.
```ruby
created_at: datetime
updated_at: datetime
```

For the "Active Storage Attachments" and "Active Storage Blobs"
Ruby on rails creates just:
```ruby
created_at: datetime
```

---

<br>

Users:
```ruby
email: string
encrypted_password: string
reset_password_sent_at: datetime
remember_created_at: datetime
```
<br>

Lunches:
```ruby
name: string
text: description
price: integer
user_id: references
street: string
suburb: string
state: string
postcode: string
```
<br>

Favorites:
```ruby
user_id: references
lunch_id: references
```
<br>

Active Storage Blobs:
```ruby
key: string
filename: string
content_type: string
metadata: text
byte_size: bigint
checksum: string
```
<br>

Active Storage Attachments
```ruby
name: string
record_tpe: string
record_id: bigint
blob_id: references
```


---
##### 7. Provide User stories for your App.
* You also just use normal markdown to describe them
* User stories are well thought out, relevant, and comprehensively cover the needs of the app
---

A user can be either a buyer or seller.

User Experience
- As a user, I want to view meals without logging in.
- As a user, I want to be able to logout at any screen.
-  As a seller, I can create listings and attach details to my listings including images.
- As a user, I want to search for meals
- As a user, I want to be able to favorite meals that I like and view them later.
- As a user, I want to be able to buy meals.
- As a user, I want payment to be handled quickly and securely.
- As a user, I want to be able to navigate the various sections of the website quickly.
- As a user, I can delete my account
- As a user, I can change my password

Authorisation
- As a seller, I shouldn't be able to purchase my own listings
- As a seller, only I should be able to edit and delete my own listings.
- As a user, only I can view and edit my favorites
- As a user, no one should be able to access my account without the correct details


---

##### 8. Provide Wireframes for your App.
* More than five detailed and well designed wireframes provided, for several different screen sizes (as required for the app)

Wireframes for home page
![home wireframe](docs/wireframes/home.png)  

Show listing page
![show wireframe](docs/wireframes/showlisting.png)  

Edit listing page
![edit listing wireframe](docs/wireframes/editlisting.png)  

Edit profile page
![edit profile wireframe](docs/wireframes/editprofile.png) 

Advanced search page
![search wireframe](docs/wireframes/search.png)

Favorites page
![favorites wireframe](docs/wireframes/favorites.png)    



---
##### 9. Describe the way tasks are planned and tracked in your project.


Tasks will be tracked and planned through the use of Trello, Evernote and the assignment criteria. I've written up the assignment criteria and allocated checkboxes in Evernote, this will help me identify what has and has not been completed. Daily tracking of tasks can be broken down and placed in Trello.

I've broken my two weeks down to roughly 4 stages.

The aim of the first stage was to get a minimum viable product(mvp) up and running. It involved generating wireframes and the mvp, consisting of getting the CRUD functionality working and systematically completing the code requirements.

The aim of the second stage was get the app deploy ready. This involved having completely finished the code requirements and testing if the app would deploy. 
Optional features such as stripe and styling were added in after deployment was successful.

At the third stage I wanted to only be putting finishing touches on the  app and start working on documentation. This stage included more styling and modifying of one of the models.

The fourth stage was basically all docs, with little adjustments and modifications added to code.


<br>

11.5.20 / Day 4 - Below image is the state of my trello board
![trello board 11th](docs/planning/11th.PNG)

14.5.20 / Day 7
![trello board 14th](docs/planning/14th.PNG)

17.5.20 / Day 10
![trello board 17th](docs/planning/17th.PNG)

21.5.20/ Day 14 - Last day
![trello board 21st](docs/planning/21st.PNG)


Below is an example of me using evernote to checkbox off tasks and quickly scaffold out drafts for them.
![evernote](docs/planning/evernote.PNG)

* Shows significant planning for how tasks are planned and tracked, including a full description of the process and of the tools used


---

##### 10. ERD provided represents a normalised database model.
* Meets D with no duplication and ideal definition of entities.
![This is an image of your ERD](docs/ERD.png)


---
## Section 3: Code specific assessment. 

This section can be deleted from the readme. I have only included it here to draw your attention to it. 

##### 11. Model implementation represents a normalised database model.
* Meets D with no duplication and ideal model implementation.

##### 12. Model implementation represents a normalised database model.
* Meets D and represents a highly optimised solution.

##### 13. Implemented controllers demonstrate correct use of commands to query the database infrastructure.
* Meets D and does so elegantly (queries chosen are the most elegant to achieve the result).

##### 14. Queries implemented provide correct data for the given scenario.
* Meets CR and demonstrates exceptional understanding of database queries.

##### 15. Code comments demonstrate how the queries implemented correctly represent the database structure.
* Meets D and all comments are exceptionally written.

##### 16. Identify and use appropriate model methods.
* Identifies and uses appropriate model methods for querying on self and its relationships, extends models scope where appropriate

##### 17. Minimising database calls needed to perform an action.
* Minimise all database calls and implement eager loading where appropriate

##### 18. Sanitise and validates input to maintain data integrity.
* Validates and sanitises all input


