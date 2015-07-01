//
//  RandomUserTests.m
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ContactList.h"
#import "RandomUser.h"

@interface RandomUserTests : XCTestCase
@property (nonatomic, strong) ContactList *contacts;
@end

@implementation RandomUserTests

- (void)setUp {
    [super setUp];
    self.contacts = [[ContactList alloc] initWithCount:10];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test random users list exists
- (void)testUserListExists {
    XCTAssert(self.contacts.randomUserList != nil, @"Random Users List does not exist");
}

// Test the user list array has correct number of entries
- (void)testUserListCount {
    long count = self.contacts.randomUserList.count;
    XCTAssert(count == 10, @"Wrong number of entries in user list array, expected 10, got %ld", count);
}

// Test each entry in the user list have the correct properties
- (void)testUserListProperties {
    BOOL noError = true;
    NSString *errorMessage = @"";
    int i = 1;
    
    for(RandomUser *user in self.contacts.randomUserList)
    {
        if(user.firstName == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no first name assigned", i];
            break;
        }
        
        if(user.lastName == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no last name assigned", i];
            break;
        }
        
        if(user.email == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no email assigned", i];
            break;
        }
        
        if(user.cellNumber == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no cell number assigned", i];
            break;
        }
        
        if(user.phoneNumber == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no phone number assigned", i];
            break;
        }
        
        if(user.imageUrl == nil)
        {
            noError = false;
            errorMessage = [NSString stringWithFormat:@"User at index %d has no image url assigned", i];
            break;
        }
        
        i++;
    }
    
    XCTAssert(noError, @"%@", errorMessage);
}

@end
