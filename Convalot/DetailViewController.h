//
//  DetailViewController.h
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHConvoreTopic;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
}
@property(nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property(nonatomic, retain) IBOutlet UITextView *outputTextView;
@property(nonatomic, retain) IBOutlet UITextField *inputField;
@property(nonatomic, retain) MHConvoreTopic *topic;

- (IBAction)sendMessage:(id)sender;
@end
