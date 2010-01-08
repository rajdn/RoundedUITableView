//
//  FlipsideViewController.m
//  RoundedTableView
//
//  Created by Jeremy Collins on 1/7/10.
//  Copyright Beetlebug Software, LLC 2010. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController


@synthesize delegate;
@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    self.tableView.editing = YES;
    cities = [[NSMutableArray alloc] initWithObjects:@"Leesburg, VA", @"Reston, VA", 
              @"Chicago, IL", @"New York, NY", @"Cupertino, CA", @"Orlando, FL", 
              @"Tampa, FL", nil];
}


- (void)viewDidUnload {
    [cities release];
    cities = nil;
}


- (IBAction)done {
    [self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)dealloc {
    self.tableView = nil;
    
    [super dealloc];
}


#pragma mark Table view methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cities count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if(indexPath.row < [cities count]) {
        cell.textLabel.text = [cities objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [cities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSString *tmp = [cities objectAtIndex:fromIndexPath.row];
    [cities removeObjectAtIndex:fromIndexPath.row];
    [cities insertObject:tmp atIndex:toIndexPath.row];
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if(proposedDestinationIndexPath.row >= [cities count]) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row < [cities count]) {
        return YES;
    }    
    
    return NO;    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row < [cities count]) {
        return YES;
    }    
    
    return NO;
}


@end
