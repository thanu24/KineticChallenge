//
//  ViewController.h
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactList.h"

@interface KineticChallengeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ContactList *contacts;

@end

