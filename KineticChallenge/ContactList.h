//
//  ContactList.h
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <Foundation/Foundation.h>

// This class handles making the Random User request, parsing the data and storing the result.
@interface ContactList : NSObject

- (id)initWithCount:(long) count;

@property (nonatomic,strong) NSArray *randomUserList;

@end
