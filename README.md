# My 2 way market place template

Link to the deployed app: https://git.heroku.com/gitgrubb.git  <br>
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
- [ ] 10. I have provided a link to my GitHub repository (repo). I have ensured the repo is accessible by my Educators.
- [ ] 11. I have a complete description of my marketplace app (website), including:  
- [X] 11.1 Purpose  
- [X] 11.2 Functionality / features  
- [ ] 11.3 Sitemap  
- [ ] 11.4 Screenshots  
- [X] 11.5 Target audience  
- [ ] 11.6 Tech stack (e.g. html, css, deployment platform, etc)  

- [X] 12. I have provided user stories for my app
- [ ] 13. I have provided Wire-Frames for my app 
- [ ] 14. I have provided an ERD for my app
- [ ] 15. I have explained the different high-level components (abstractions) in my app
- [ ] 16. I have listed and described any third party services that your app will use
- [ ] 17. I have described my projects models in terms of the relationships (active record associations) they have with each other.
- [ ] 18. I have discussed the database relations to be implemented in my application
- [ ] 19. I have provided my database schema design
- [X] 20. I have described the way tasks are allocated and tracked in my project

NB Slide/Presentation specific requirements

- [ ] 21. An outline of the problem I solved by building this particular marketplace app, and why it’s a problem that needs solving.
- [ ] 22. A well planned walkthrough of my app
- [ ] 23. I have practiced my presentation at least once and it is 5-6 minutes long. 


---

#### Purpose
The purpose of my marketplace is to connect cooks and users together and facilitate the exchange of food and currency between them.

#### Functionality / features  

**User accounts** - 
Users can make accounts to access all the features of the website. Users can also edit their password or delete their account.

**Listings** - 
Users that are not signed in can view the index and click to view listings but are restricted from purchasing meals.
Logged in users can create meal listings and edit them as needed. They can also attach pictures and an address for the listing.

**Favorites** -
Logged in users can favorite meals by clicking the favorite link displayed when viewing a single meal. All favorites can be viewed from the navigation bar.

**Secure Payment** -
Payments are handled by stripe, a well-known payment platform that accepts credit cards and google pay. 

#### Sitemap  

#### Screenshots  

#### Target audience  
The main audience are busy individuals and individuals seeking food that offers competitive pricing and healthier alternatives than traditional options.

#### Tech stack (e.g. html, css, deployment platform, etc)  
Application and Data
- Html
- CSS
- Ruby
- Ruby on Rails
- Heroku 
- Bulma
- Postgresql
- Amazon S3
- jQuery
- Javascript

DevOps
- Github
- Git

Utilities
- Stripe
- Trello
- Evernote

---
### Rubric Criteria

## Section 2: Documentation
---
NB leave the Titles as they are and answer the questions below.

##### 1. Explain the different high-level components (abstractions) in your App.
* Includes a complete and detailed description of third party services used in the app



<!-- Is this like the MVC ? 
not sure what it means by high-level components (abstractions) -->
talk about how high-level components work 

database/MVC

##### 2. List and describe any 3rd party services.
* Precisely explains and shows understanding of the different high-level components of the app

Use of Devise gem for user authentication and authorisation. The devise gem automatically generates a User model for us that we can use to assign unique accounts to. It allows us to assign emails and passwords to a user and can generate the views necessary to display login pages and 

Stripe used for payments

Amazon S3 for image uploading and cloud storage of images.

Bulma was used as a css framework for quickly applying styling to various components. 

Faker gem was used to generate fake seed data. This was used to test functionality of the models and provide visual feedback of how views would render.

Jquery-rails was added so that I could have the favorites button work dynamically without re-rendering the whole webpage.

##### 3.1. Identify the problem you’re trying to solve by building this particular marketplace App?
* Demonstrates a full understanding of the problems that exist in a relevant marketplace that needs disrupting

The problem I'm trying to solve is the lack of options when it comes to meals. Options such as going out to eat at a restaurant during the coronavirus pandemic are not possible, considering most restaurants have shut or drastically reduced their open times and/or seating capacity. 
This leaves the options of cooking your own food or getting food delivered. Delivery options are expensive-for what you get and if it's not expensive than it's usually fast food which isn't particularly healthy.
For the person who can't cook or doesn't have the time to make meals. GitGrub offers an alternative to fast food and the exorbitant pricing for a good meal.
GitGrub gives you access to the home cooking of anyone willing to place their food up for sale. 

These meals could be anything from breakfasts, to lunches and dinners. By opening the market up to anyone who can cook we can allow for a more dynamic food market where naturally food options are diversified, prices are competitive and food of high-quality is popular.

##### 3.2 Why is the problem identified a problem that needs solving?
* Demonstrates a full understanding of the problems that exist in a relevant marketplace that needs disrupting

This problem needs solving as busy individuals and individuals looking for affordable and healthy meals are starved for options. 
Especially during the coronavirus pandemic, options are limited and now that more people are forced to stay at home, it may be comforting to have alternatives.
By making an app to connect cooks and users we can open the market up to cooks,families and meal preppers that can take advantage of a unique time where most people are eating at home.

The open market also allows for more competitive prices and higher-quality food which will naturally sell more than lesser-quality food, this creates an incentive to maintain quality and innovate on better dishes.


##### 4. Describe your project’s models in terms of the relationships (active record associations) they have with each other.
* Complete discussion of the project’s models with an understanding of how its active record associations function

<!-- Active record associations allow active record models to be associated with each other and interact with each other in an abstracted way.

Dependent controls what happens to the object when the parent is destroyed. 
Dependent Destroy causes the associated object to be destroyed.  -->

The Favorites model is used to attach a favorite to a specific lunch and associate that to a user. A Favorite belongs to User and Lunch. The combination of both of these act as a join table to define Favorites.
If a favorite only belonged to a user then there would be no reference to a lunch and vice-versa.

The Lunch model is used to store the associated data for a meal. It belongs to a User which means each Lunch item can only be associated and created by a single user, i.e A lunch item can not have many users associated with it.

A User has many Lunches and many Favorites. 

##### 5. Discuss the database relations to be implemented.
![This is an image of your ERD](This is the relative path to it)
* Provides coherent discussion of the database relations, with reference to the ERD

numbers and screenshots

##### 6. Provide your database schema design.
* Flawless, complex, complete, and well thought through ERDs provided

##### 7. Provide User stories for your App.
![This is an image of your user stories](This is the relative path to it)
* You also just use normal markdown to describe them
* User stories are well thought out, relevant, and comprehensively cover the needs of the app

A user = buyer/seller
A user can buy meals and also list meals for sale

A user should be able to view meals without logging in
A user can logout at any screen
A user can only edit and delete their own listings
A user can place a description, price, address for their listing
A user can attach an image for their listing
A user can purchase meals by paying through stripe
A user can favorite a meal that they like
A user can view all their favorites
A user can navigate to parts of the website through the navigation bar



##### 8. Provide Wireframes for your App.
![This is an image of your wire frames](This is the relative path to it)  
![This is an image of your wire frames](This is the relative path to it)  
![This is an image of your wire frames](This is the relative path to it)  
![This is an image of your wire frames](This is the relative path to it)  
![This is an image of your wire frames](This is the relative path to it)  

* More than five detailed and well designed wireframes provided, for several different screen sizes (as required for the app)

##### 9. Describe the way tasks are planned and tracked in your project.


Tasks will be tracked and planned through the use of Trello, Evernote and the assignment criteria. I've written up the assignment criteria and allocated checkboxes in Evernote, this will help me identify what has and has not been completed. Daily tracking of tasks can be broken down and placed in Trello.

I've broken my two weeks down to roughly 4 stages.

The aim of the first stage was to get a minimum viable product(mvp) up and running. It involved generating wireframes and the mvp consisted of getting the CRUD functionality working and systematically completing the code requirements.

The aim of the second stage to get be deploy ready. This involved having completely finished the code requirements and adding in optional features such as stripe. 
The second stage involved getting the app deploy ready and adding in styling and optional features such as stripe payments. 

At the third stage I wanted to get most of the app done and start working on documentation. This stage included more styling and modifying of one of the models.  


<br>

11.5.20 / Day 4 - Below image is the state of my trello board
![trello board 11th](docs/11th.PNG)

14.5.20 / Day 7
![trello board 14th](docs/14th.PNG)\

17.5.20 / Day 10
![trello board 17th](docs/17th.PNG)


![This is an image of your task planning](This is the relative path to it)

* Shows significant planning for how tasks are planned and tracked, including a full description of the process and of the tools used


##### 10. ERD provided represents a normalised database model.
![This is an image of your ERD](This is the relative path to it)
* Meets D with no duplication and ideal definition of entities.



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


