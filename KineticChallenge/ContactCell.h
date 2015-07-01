//
//  ContactCell.h
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *cellLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneLabel;
@property (nonatomic, weak) IBOutlet UIImageView *userImageView;

@end
