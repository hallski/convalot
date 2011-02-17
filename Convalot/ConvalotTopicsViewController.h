//
//  ConvalotTopicsViewController.h
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHConvoreGroup;

@interface ConvalotTopicsViewController : UITableViewController {
    
}
@property(nonatomic, retain) MHConvoreGroup *group;
@property(nonatomic, copy) NSArray *topics;

- (id)initWithStyle:(UITableViewStyle)style group:(MHConvoreGroup *)group;

@end
