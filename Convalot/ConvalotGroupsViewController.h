//
//  RootViewController.h
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface ConvalotGroupsViewController : UITableViewController {
}
@property(nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property(nonatomic, copy) NSArray *groups;

@end
