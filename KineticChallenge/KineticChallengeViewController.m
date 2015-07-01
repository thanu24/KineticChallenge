//
//  ViewController.m
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import "KineticChallengeViewController.h"
#import "RandomUser.h"
#import "ContactCell.h"

@interface KineticChallengeViewController ()

@end

@implementation KineticChallengeViewController

long const ContactsCount = 10;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contacts = [[ContactList alloc] initWithCount:ContactsCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDataSourceDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ContactsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RandomUser *user = [self.contacts.randomUserList objectAtIndex:indexPath.row];
    static NSString *ContactCellIdentifier = @"ContactCell";
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ContactCellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContactCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    cell.emailLabel.text = user.email;
    cell.cellLabel.text = user.cellNumber;
    cell.phoneLabel.text = user.phoneNumber;
    
    // Make the image loading async to improve table view performance.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:user.imageUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            cell.userImageView.image = image;
        });
    });
    
    return cell;
}

@end
