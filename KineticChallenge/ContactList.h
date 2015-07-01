//
//  ContactList.h
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactList : NSObject

- (id)initWithCount:(long) count;

@property (nonatomic,strong) NSArray *randomUserList;

@end
