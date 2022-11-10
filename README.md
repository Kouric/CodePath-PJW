Original App Design Project - README Template
===

# Spotifly

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

Spotifly is an app where users can earch for songs and create their own playlists. Users can also track their Spotify data such as their most listened to songs, albums, and genres. Users can also view artist info.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Music
- **Mobile:** The app is being developed for mobile devices but it is possible to be used on desktop devices as well.
- **Story:** Gets Spotify song data from the Spotify API. User can search for songs and create playlists. Users can view their playlists, add and remove songs, and delete playlists. Users can listen to the song.
- **Market:** Any person can use this app.
- **Habit:** This app can be used often if a user wants to listen to music and check their Spotify data.
- **Scope:** First we could begin by showing users their basic listening info. Later, we could expand the app to feature more detailed statistics such as global statistics or artist information.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can listen to music
* User can log in
* User can log out

**Optional Nice-to-have Stories**

* User can stay logged in across restarts
* User can save favorite songs
* User can see editor recommendations

### 2. Screen Archetypes

* Welcome Screen
   * User selects to login or register for a new account
   * This screen will not display if user is logged in
* Login Screen
   * User types username and password
* Register Screen
   * User provides name, creates a username, and password
* Home Screen
   * User scrolls and selects recently played song
* Search Screen
   * User searches and scrolls for songs
* Favorites Screen
   * User scrolls for favorite songs
* Media Player Screen
   * Allowing user the control of media playback
   * User can save song as favorites

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Search
* Favorites

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Account creation if no log in is available
* Home screen -> Can view recently played music
* Search screen -> Can search up songs to listen to
* Favorites screen -> Can pick from liked songs

## Wireframes
[Add picture of your hand sketched wireframes in this section]
![](https://i.imgur.com/AUWHeLl.jpg)


### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/57ZVMHa.jpg)


### [BONUS] Interactive Prototype

## Schema 
### Models
#### Post
| Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field)
   | author        | Pointer to User| author's name 
   | action       | String   | description of action
   | artist    |    String    | name of the artist
   | song     | String   | name of the song
   | album    | String    | name of the album
   | createdAt     | DateTime | date when post is created (default field) 
   
   
### Networking
#### List of network requests by screen
- Login Screen
    - (GET) Username validation
    - (GET) Password validation
- Register Screen 
    - (Create/POST) Create a new user
    - (GET) Validate username is available
- Home Screen
    - (Read/GET) Recently played songs
    - (Read/GET) Our picks
    - (Read/GET) Best album played
- Favorites
    - (Read/GET) Query logged in user object
- Player
    - (GET) Get song to play
    - (POST) Add song to favorites
    - (DELETE) Remove song from favorites   
