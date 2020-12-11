# Cash Backie Capstone Project
by Jonathan Cheon

### What
Cash Backie is an iOS app that recommends the best credit cards to use to maximize cash back based on your location. 

### Why
This app came from my interest in personal finance and credit cards. One of the best things about credit cards is getting the rewards. Since each credit cards are unique in their's benefits, it becomes incredibaly difficult to use the best card. At each of my purchases, I always have to make a difficult choice of choosing the card with the maximum cash back. I was tired of this and decided to make it my capstone project. Next time I'm at a store, I could just pull up my app and it can tell me which card to use. 

I hope this app could help others that have lots of credit cards or want to maximize their cash back. Cash Backie makes choosing the card easier :) 

## Requirements
- Signup/Login feature: To make the card recommendation tailored to the user. 
- Card Input: To know which credit cards the user has. 
- Location: To see which stores are nearest to user. 
- Recommendations: Displays a list card recommendations to each store within 1600m (~1 mile).

## Requirements and Test Planes
- Signup: 
  - Click on Register
  - Type in email
  - Type in password
  - Can you create an account? If not, does the UI display some information for you to make a successful account? 
  - Go to Firebase Firestore and check if new account is added. 
  - Go to Firebase Authentication is added. 

- Login: 
  - After account creation, can the user use their registration info and log in? 
  - If email doesn't exist in database, does the UI let you know? 
  - If password does not match email, does the UI let you know? 
  - 

- Users should be able to choose which credit cards they have. 
  - Is there a screen where users could add credit cards into their account? 
  - Click on cards to add into your account. 
  - Go to Firebase Firestore and go to 'user_info' and check if new credit card is added. 
  
- FINAL REQUIREMENT: Does app display nearest stores with best credit card to use? 
  - Users should be shown which stores are close to them and which cards they should use. 
  - Does the app provide which card is best for a particular store? 
  
  
Requirements completion estimation: 90% (Check Release Notes for more information)


## Release Notes
v 0.0.1
- Unable to add credit cards into account on the front end side. Backend REST endpoint has been created however. You must go into Firestore and go to particular user_info document, then add credit card ID into the user's account. 
- Unable to display final result on the frontend. Backend REST endpoint has been created located at /latlong/userid to return a json with nearest stores, credit card, cashback value, and image of the card. 
- Google places API currently returns store that is near. In future release, I want to filter out places that we're not interested in like City, offices, or any place that is not a place to use a credit card. 

v 0.0.2 preview
- Use the REST API to allow users to add credit cards into their accounts. 
- Use REST API to display the final requirement dynamically for each user. 
- Filter out unnecessary places that credit card users would not be interested in using their card. 
  
  
### Tech Stack
- Flutter
- Dart
- Xcode
- Firebase Firestore
- Firebase Authentication
- Google Places API
- Uvicorn 
- FastAPI
- Looking for [RESTAPI](https://github.com/jcheon/capstone_api_server)?
