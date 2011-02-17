//
//  ConvalotAppDelegate.h
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MHConvoreClient.h"

@class ConvalotGroupsViewController;

@class DetailViewController;

@interface ConvalotAppDelegate : NSObject <UIApplicationDelegate, MHConvoreClientListener> {
}

@property(nonatomic, retain) IBOutlet UIWindow *window;
@property(nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property(nonatomic, retain) IBOutlet ConvalotGroupsViewController *rootViewController;
@property(nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property(nonatomic, retain) MHConvoreClient *convoreClient;
@end
