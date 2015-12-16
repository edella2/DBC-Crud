# CRUD skeleton

###Javascript/Jquery/AJAX

#####See application.js file

When write blog link is clicked
hide write blog button and
append blog form in its place
You would click a "enter a new post button"
the button will be replaced with a form partial
the form partial when filled out will append a new partial containing the new element you created
the "enter a new post button will return"
the form partial will disappear


###Basic routes for users/sessions and a single model

A basic set up with views and controllers was created for a single model - templates.  You can control find and change template to be whatever class you need after creating it.  You will need to do small edits for your edit route and forms to include the information you are supplying.

This template will display title and body and belongs to a user.

###Sessions/Login

Login and creating users is included with this skeleton.  Email should be unique identifier for this.

###Helper Methods

Helper methods have been written to make:
finding the current user based on session id.
seeing if a user is logged in with a valid session id.
seeing if a user can edit a post if their session id matches the template user id.


###Questions for template

Ask Eric Dell'Aringa on copperheads slack or email: edella2@gmail.com
