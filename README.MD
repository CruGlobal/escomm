ME-2-YOU README<br />
======

##Staging Site  

https://escomm-stage.cru.org/

##Description  

This web app allows you to invite people to receive an email series from you. After they signup, emails will be sent from you, in an automated, timed way. They will be sent from your email address. And people who sign up will be able to reply to you with their thoughts or questions. You will know how many people have signed up, who they are, and how far along they are in the series. You will have their email address and will be able to reach out to them, to see if they have any questions, or perhaps invite them to meet with you or come to an event.

##API Calls

For all calls passed an authentication token is assumed in the HTTP header or in a query string.

###FIRST PHASE:

####Send Invitation
######HTTP POST:
- Recipients array with first name, email
- Language
- Email series id
- Customized intro message (optional)

Example JSON:
```json
{
    "recipients":[
    	{"firstName": "Sarah", "email": "sarah@email.com"},
    	{"firstName": "Andy", "email": "andy@email.com"},
    	{"firstName": "Barry", "email": "barry@email.com"},
    	{"firstName": "Candice", "email": "candice@email.com"}
    ],
    "lang": "en",
    "emailID": 1,
    "customizedIntroMsg": "lorem ipsum customized intro message"
}
```

######Expected Server Action:
- Find proper invite email based on email language and id
- Generates unique urls for starting and unsubscribing from email series (one way to approach this is create an URL with the hash of the sender and recipient emails) Requires functions to start and stop the email series
- Email contains name of inviter in the “from” field
- Email contains reply button that goes to inviter’s email
- Email contains start email series button to unique URL
- Email contains unsubscribe button to unique URL
- Send invite email to recipient(s)

######Response from Server:
- Confirmation or failure of sending message and error message if necessary

Example JSON:
```json
{
    "success": "false",
    "errMsg": "Error Message Here"
}
```


###SECOND PHASE:

####Edit Email Series
######HTTP POST:
- Email Series ID and Lesson ID
- Language

Example JSON:
```json
{
    "emailSeriesID": 1,
    "lessonID": 3,
    "lang": "en"
}
```

######Expected Server Action:
- Searches for and returns requested lesson

######Response from Server:
- JSON with lesson, editable section,
- salutation, signature of inviter (current user)

Example JSON:
```json
{
    "editableSection1": "lorem ipsum1....",
    "editableSection2": "lorem ipsum2....",
    "lesson": "lorem ipsum lesson",
    "salutation": "Sincerely,",
    "signature": "Sarah S."
}
```

####Save Email Series
######HTTP POST:
- Email Series ID and Lesson ID
- Language
- Edited sections

Example JSON:
```json
{
    "emailSeriesID": 1,
    "lessonID": 3,
    "lang": "en",
    "editedSections": {
    	"section1": "edited section1",
    	"section2": "edited section2",
    }
}
```

######Expected Server Action:
- Save edited lesson to user’s customized series

######Response from Server:
- success or failure

Example JSON:
```json
{
    "success": "true",
    "errMsg": ""
}
```

####Edit User Preferences
######HTTP POST:

######Expected Server Action
- Retrieve and return user preferences

######Response from Server:
- success or failure
- JSON of user’s salutation and signature

Example JSON:
```json
{
    "success": "true",
    "errMsg": "",
    "salutation": "Sincerely,",
    "signature": "Sarah S."
}
```

####Save User Preferences
######HTTP POST:
- Salutation, signature, password

Example JSON:
```json
{
    "salutation": "Sincerely,",
    "signature": "Sarah S."
}
```

######Expected Server Action:
- Save user preferences

######Response from Server:
- success or failure

Example JSON:
```json
{
    "success": "true",
    "errMsg": ""
}
```

####Display Contact Activity (Tracking Stats)
######HTTP POST:

######Expected Server Action:
- Retrieve and return user’s friends who have been invited

######Response from Server:
- success or failure
- contacts' name, last activity(email opens), open percentage, progress

Example JSON:
```json
{
    "success": "true",
    "errMsg": "",
    "contacts": [
    	{"firstName": "Andy", "lastActivity": "2/3/2016", "openPercentage": "80%", "progress": "5/8"},
    	{"firstName": "Barry", "lastActivity": "1/15/2016", "openPercentage": "0%", "progress": "0/8"},
    	{"firstName": "Candice", "lastActivity": "2/1/2016", "openPercentage": "100%", "progress": "8/8"}
    ]
}
```

####Contact Us
######HTTP POST:
- message to send

Example JSON:
```json
{
    "msg": "lorem ipusm message"
}
```

######Expected Server Action:
- send email

######Response from Server:
- success or failure

Example JSON:
```json
{
    "success": "true",
    "errMsg": ""
}
```


##Build Process

Temporary build instructions for hosting it on the Cru staging site

Ruby version<br />
2.2.1<br />

To build:<br />
cd client
./build.sh


To start Ruby server:<br />
In root directory:<br />
$ rails s<br />

To add a new language translation:<br />
cd client<br />
./build.sh //ensures latest version<br />
Copy client/po/template.pot<br />
Save translated file in client/po directory<br />