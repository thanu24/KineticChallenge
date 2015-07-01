//
//  ContactList.m
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import "ContactList.h"
#import "RandomUser.h"

@implementation ContactList

- (id)initWithCount:(long) count
{
    self = [super init];
    NSString *url = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%ld", count];
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
        
        NSArray *results = [json objectForKey:@"results"];
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
        
        NSDictionary *userDict = [entry objectForKey:@"user"];
        
        NSDictionary *nameDict = [userDict objectForKey:@"name"];
        user.firstName = [nameDict objectForKey:@"first"];
        user.lastName = [nameDict objectForKey:@"last"];
        
        user.email = [userDict objectForKey:@"email"];
        user.phoneNumber = [userDict objectForKey:@"phone"];
        user.cellNumber = [userDict objectForKey:@"cell"];
        
        NSDictionary *pictureDict = [userDict objectForKey:@"picture"];
        user.imageUrl = [pictureDict objectForKey:@"medium"];
        
        [userList addObject:user];
    }
    
    self.randomUserList = [[NSArray alloc] initWithArray:userList];
}

@end
