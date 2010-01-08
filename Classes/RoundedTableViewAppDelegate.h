//
//  RoundedTableViewAppDelegate.h
//  RoundedTableView
//
//  Created by Jeremy Collins on 1/7/10.
//  Copyright Beetlebug Software, LLC 2010. All rights reserved.
//

@class MainViewController;

@interface RoundedTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

