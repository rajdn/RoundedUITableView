//
//  FlipsideViewController.h
//  RoundedTableView
//
//  Created by Jeremy Collins on 1/7/10.
//  Copyright Beetlebug Software, LLC 2010. All rights reserved.
//

#import "RoundedUITableView.h"


@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
    id <FlipsideViewControllerDelegate> delegate;
    RoundedUITableView *tableView;
    NSMutableArray *cities;
}


@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet RoundedUITableView *tableView;


- (IBAction)done;


@end


@protocol FlipsideViewControllerDelegate


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;


@end

