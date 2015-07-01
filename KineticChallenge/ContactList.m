//
//  ContactList.m
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import "ContactList.h"
#import "RandomUser.h"

// Constant Strings
NSString *const RandomUserBaseUrl = @"http://api.randomuser.me/?results=";
NSString *const ResultsKey = @"results";
NSString *const UserKey = @"user";
NSString *const NameKey = @"name";
NSString *const FirstNameKey = @"first";
NSString *const LastNameKey = @"last";
NSString *const EmailKey = @"email";
NSString *const PhoneKey = @"phone";
NSString *const CellKey = @"cell";
NSString *const PictureKey = @"picture";
NSString *const MediumPictureKey = @"medium";

@implementation ContactList

// Initialize the class with the number of contacts
- (id)initWithCount:(long) count
{
    self = [super init];
    NSString *url = [NSString stringWithFormat:@"%@%ld", RandomUserBaseUrl, count];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error];
        
        NSArray *results = [json objectForKey:ResultsKey];
        [self ParseResultWithResponseArray:results];
    }
    
    return self;
}

- (void)ParseResultWithResponseArray:(NSArray *)results
{
    NSMutableArray *userList = [[NSMutableArray alloc] initWithCapacity:[results count]];
    for(NSDictionary *entry in results)
    {
        RandomUser *user = [[RandomUser alloc] init];
        
        NSDictionary *userDict = [entry objectForKey:UserKey];
        
        NSDictionary *nameDict = [userDict objectForKey:NameKey];
        user.firstName = [nameDict objectForKey:FirstNameKey];
        user.lastName = [nameDict objectForKey:LastNameKey];
        
        user.email = [userDict objectForKey:EmailKey];
        user.phoneNumber = [userDict objectForKey:PhoneKey];
        user.cellNumber = [userDict objectForKey:CellKey];
        
        NSDictionary *pictureDict = [userDict objectForKey:PictureKey];
        user.imageUrl = [pictureDict objectForKey:MediumPictureKey];
        
        [userList addObject:user];
    }
    
    self.randomUserList = [[NSArray alloc] initWithArray:userList];
}

@end
