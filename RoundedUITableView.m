//
//  RoundedUITableView.m
//  RoundedTableView
//
//  Created by Jeremy Collins on 1/7/10.
//  Copyright 2010 Beetlebug Software, LLC. All rights reserved.
//

#import "RoundedUITableView.h"
#import <QuartzCore/QuartzCore.h>


@implementation RoundedUITableViewMask


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat cornerRadius = 10.0;
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat midx = CGRectGetMidX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat midy = CGRectGetMidY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, cornerRadius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, cornerRadius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, cornerRadius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, cornerRadius);
    CGContextClosePath(context);
    CGContextFillPath(context);
}


- (void)dealloc {
    [super dealloc];
}


@end



@implementation RoundedUITableView


- (void)setupView {
    mask = [[RoundedUITableViewMask alloc] initWithFrame:CGRectZero]; 
    self.layer.mask = mask.layer;
    self.layer.cornerRadius = 10;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;    
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
	[self setupView];
    }

    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
	[self setupView];
    }
    
    return self;
}


- (void)adjustMask {
    // Re-calculate the size of the mask to account for adding/removing rows.
    CGRect frame = mask.frame;
    if(self.contentSize.height > self.frame.size.height) {
    	frame.size = self.contentSize;
    } else {
        frame.size = self.frame.size;
    }
    mask.frame = frame;

    [mask setNeedsDisplay];
    [self setNeedsDisplay];
}


- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [super deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self adjustMask];
}


- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [super insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self adjustMask];
}


- (void)reloadData {
    [super reloadData];
    [self adjustMask];
}


- (void)dealloc {
    [mask release];
    [super dealloc];
}


@end
