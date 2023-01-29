# tamuhack 2023 - Friendscape
## Eric Shields, Shamitha Thumma, Manish Mallik, Avani Garde

## Inspiration
With the return to in person workplaces post pandemic, employees, especially new hires (and remote interns such as ourselves), have been finding it difficult to connect with new people at the office. We wanted to make this process easier by designing an application that not only lets you connect with people in your workplace and rideshare with colleagues, but allows you to explore local hotspots while forging new friendships.

## What it does
Based on your location, interests and organization/company, our app presents you with others in your area who you may get along with. On a business trip, use Friendscape to find things to do, coworkers who also want to explore, or connect with locals with the individual login option. Friendscape also facilitates ride sharing, so you can easily catch or offer a ride to your colleagues!

## How we built it
We built the app using Flutter as our frontend framework, Firebase and Firestore as our backend, and Dart as our overall programming language. We also used Place API from Google Maps API.

## Challenges we ran into
One of the challenges we faced was implementing the map with live location and points of interest. Initially, Google gave us all nearby coordinates instead of just relevant points of interest, so we had to query the data in order to get relevant points of interest and display them in a visually appealing way. 
Another challenge we faced was with the Hotspots section. The Places API was very challenging to implement as a thumbnail with a title and photo. We resolved this problem by building future state widgets and displaying them as a tiled list view so that each element would appear organized and uniform on the page.

## Accomplishments that we're proud of
Though the map was initially difficult to query, we felt that it was a very important tool to include in the application and we are proud to have it running properly.
We’re also proud of our UI/UX design - we spent a lot of time focusing on detail to ensure an overall clean look. And, this is all of our members’ first times visiting Texas A&M!


## What we learned
We learned more about working with Flutter and Dart and were able to get very hands on with widget layouts. This afforded us a lot of creativity in app design and allowed us to experiment with different UX elements.

## What's next for Friendscape
Coming up, we’d love to offer an enterprise service to companies on a per employee basis. We will also monetize individual accounts through ads. We want to add an integrated chat to allow users to communicate with their rideshare partner or connect with colleagues offline. We also want to connect social media going forward, such as instagram and LinkedIn, so that employees can get to know each other outside of the office as well. 
