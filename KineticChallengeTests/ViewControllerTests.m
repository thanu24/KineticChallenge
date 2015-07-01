//
//  ViewControllerTests.m
//  KineticChallenge
//
//  Created by Thanu Chandrarajah on 7/1/15.
//  Copyright (c) 2015 Thanu Chandrarajah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface ViewControllerTests : XCTestCase
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = [storyboard instantiateViewControllerWithIdentifier:@"KineticChallengeViewController"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    NSArray *subviews = self.viewController.view.subviews;
    for (UIView *view in  subviews)
    {
        if([view isKindOfClass:[UITableView class]])
        {
            self.tableView = (UITableView *)view;
            break;
        }
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test that the view loads
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.viewController.view, @"View does not load");
}

// Test that the view controller has a table view as one of it's subview
- (void)testTableViewExists
{
    XCTAssert(self.tableView, @"Tableview doesn't exist");
}

// Test that the view controller has protocol UITableViewDataSource
- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not contain UITableView datasource protocol");
}

// Test that the view controller has protocol UITableViewDelegate
- (void)testThatViewConformsToUITableView
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not contain UITableView protocol");
}

// Test that the table view contains the correct number of rows
- (void)testTableViewNumberOfRowsInSection
{
    NSInteger expectedRows = 10;
    NSInteger rows = [self.tableView numberOfRowsInSection:0];
    XCTAssert(rows == expectedRows, @"Incorrect number of rows in table view, expected %ld but got %ld", (long)expectedRows, (long)rows);
}

@end
