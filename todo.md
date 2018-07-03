## Test images

### Good

- http://www.sciencemag.org/sites/default/files/styles/article_main_medium/public/images/ss-bird_honeycreeper.jpg
- https://qph.ec.quoracdn.net/main-qimg-d5ef14a6733e4a0ff207c4c26db52341-c
- https://qph.ec.quoracdn.net/main-qimg-eaa2d37b5813736d0f04deda26fa6d6f-c1
- https://qph.ec.quoracdn.net/main-qimg-c4ea08d59fd099cde45014640402e767-c
- https://qph.ec.quoracdn.net/main-qimg-6f1806cb0f3129675d0422c51174edcd-c

### Bad

- https://cdn.images.dailystar.co.uk/dynamic/28/photos/946000/620x/Plane-painted-white-548527.jpg
- http://static4.uk.businessinsider.com/image/5508ae2cdd089581048b460a-480/sr-71-spy-plane.jpg

## Todo

 export GOOGLE_APPLICATION_CREDENTIALS=~/key.json

## Story

"Bird identification society"

Their normal process is as follow:

- People contact the society
- Clerk tell them to mail the image, their phone number and where they saw the bird
- Clerk receive the info, check that it's not a joke (like: it's a bird)
- Clerk calls an expert, giving him the info
- Expert gives the exact species
- Clerk call the person back and give the info

(show trello board with some cards in)

They have too many request during those holidays time from people wanting to identify the birds they found. In addition they get a lot of pranksters sending cars pictures

They want to cut costs

- Send and image + phone number from a form
- check with google vision if image it's a bird
- Call an expert for exact species
- Send an SMS to the end user with confirmation

On the server:

- A form to get the image (url + text + SMS) and store it (basic DB model)
- calling vision API
- contains "bird"?
  - yes: call expert, give info, store back answer
  - no: reject the request from the prankster
- send data back to the user

Bonus: geoloc & send that info too (reverse geolocate)

## Steps

### x Form

- Create a form with where it was found, phone number, image url, store in model (scaffold)
- Could scaffold model with Request phonenumber where image
- Bootstrap a bit (get it in the Gemfile from scratch?)

### x Start process

- Create card on trello with the info, using an API call

### x Identify bird

- Call google vision and check if contains "bird"
  - add "words" go model, store words there (; separated)
  - if so, create in valid column
  - if not, create in rejected column

### Call the expert

Along the way: ngrok rocks!

- If words contains bird, calls the expert with: "Hi, this is the BIS, a user found a bird near <where> and we though it could be <words>. Can you tell us?
- Add sid to model and store
- On call back, store answer in "expert opinion" & move to done

### Call user back

- "Hi this is the BIS, according to our expert, you just found a <expert_opinion>

Now our clerk is looking for work

## Some words

### Mind your keys
* They can be used to impersonate you/your app
* Or worse

### So, you just coupled your business to someone else whims

* Google Translate example
* Twitter example
* Facebook Developer API

### This is an incredible time to be a developer

* Hard problems vs Solved problems
* Hard but solved:
  - Route planning (google maps)
  - Encryption (bcrypt, etc)
  - Voice recognition
  - Image analysis
* Infrastructure heavy
  - Route planning (google maps)
  - Image analysis

# Trello

- Board id = "96U4Kigb"
- List id = "5b3a7a4972ee34864fd37c97"
- API key = "11cfa382a2826e97c8302265b85ed643"
- Token = 2e76f72a9a80082df9655ec25e4fc23524968efbc92623c03a623fd9de698f43
- Test route: https://api.trello.com/1/boards/96U4Kigb?fields=name,url&key=11cfa382a2826e97c8302265b85ed643&token=2e76f72a9a80082df9655ec25e4fc23524968efbc92623c03a623fd9de698f43
- Show lists: https://api.trello.com/1/boards/96U4Kigb/lists?fields=name,url&key=11cfa382a2826e97c8302265b85ed643&token=2e76f72a9a80082df9655ec25e4fc23524968efbc92623c03a623fd9de698f43