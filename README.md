My Overall Approach:

I decided to create a native iOS application using objective-c. I went with a MVC design with a single view for this project. 
The model contains a list of random users retrieved from the https://randomuser.me/ api. The view contains a table view that 
displays the users' name, email, phone numbers and image. I used a constant value of 10 as the number of users I was retrieving 
from the api. For the images shown for each user, I decided to make it a load asynchronously to improve scrolling and overall 
performance of the table view. For the web request, I went with a synchronous call since this application does not do anything 
else. Thus, blocking the main thread on this request didn't seem bad. However, if this is part of a bigger application, I would 
change it to an asynchronous web call. 

I wrote two classes of test cases. The first set of test cases is to verify the functionality of the view controller. It makes sure
that the view controller has a table view with the correct number of entries. The next set of test cases tests the model. It 
verifies that the data retrieved from the web api is stored correctly and has all the correct properties. 

Platform chosen:

I chose to go with iOS with a minimum supported version of iOS 6. The reason I picked iOS was mainly because I was more familiar
with the UIKit and the TableView Framework in iOS more. Since this project was timeboxed, it is not optimized for iPad or landscape
more yet. 

Features completed:

A basic view with a list of contacts using the Random user api. Each entry in the table view contains the user's first and last
names, email, cell phone number, home phone number as well as a thumbnail of their image. 

Given more time, what other features I would have added:

As mentioned earlier, with more time I would have added iPad and landscape support. I also would have added messages in the UI,
had something gone wrong when retrieving info from the web api. Currently, only the successful retrieval is handled and shown to
the user. Another feature, I would love to add is the ablility to click into each entry in the table and see more info about each
user. 

Given more time, what I would have done to make the code more robust:

First, I would write more test cases around the web request. I would write test that verifies a connection can be established
and date is retrieved properly. I would also verify the json response from that request has all the fields we expect.

I would also, refactor the web request code out of the ContactList model. Since this was a fairly small project that just does
this one thing and the time constraint I was under, I didn't make it as extensible as I would have liked. With more time, I would
make the web request, response handling and error checking abstract so it can be a service that can be used by other features 
through out the application.

Furthermore, I would spend more time around the error handling in my web request code. Currently, the code assumes everything 
will work fine and the network call will succeed and return the data in the expected format. In mobile applications, where the 
user is travelling constantly, expecting them to have network connection all the time, is a dangerous assumption and should be 
corrected to handle network failures. I would check for these error cases and with more time, I would work on some additional UI
flows that communicates to the user when a network related failure occurs. 

Deployment requirements and instructions:

You need to have xcode 6.1.1 or later installed on your mac. 
Open KineticChallenge.xcodeproj in xcode. Press run to run on a simulator. 
If you wish to run on a device, you will need to sign the application and run on a provisioned iOS device.

Testing Instructions:

Open the KineticChallenge.xcodeproj in xcode.
Press 'Product' menu at the top and click on 'Test'.
The console will then tell you how many success/failures occured from that run. 

