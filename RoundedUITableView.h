//
//  RoundedUITableView.h
//  RoundedTableView
//
//  Created by Jeremy Collins on 1/7/10.
//  Copyright 2010 Beetlebug Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoundedUITableViewMask : UIView {
}


@end


@interface RoundedUITableView : UITableView {
    RoundedUITableViewMask *mask;
}


- (void)adjustMask;


@end
