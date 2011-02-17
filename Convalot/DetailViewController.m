//
//  DetailViewController.m
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import "DetailViewController.h"
#import "ConvalotGroupsViewController.h"
#import "ConvalotClient.h"


@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation DetailViewController
@synthesize toolbar=_toolbar;
@synthesize outputTextView = _outputTextView;
@synthesize inputField = _inputField;
@synthesize popoverController=_myPopoverController;
@synthesize topic = _topic;

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setTopic:(MHConvoreTopic *)topic
{
    if (_topic != topic) {
        [_topic release];
        _topic = [topic retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    [[ConvalotClient sharedClient] messagesInTopic:self.topic.topicId block:^ (NSArray *messages, NSError *error) {
        if (error == nil) {
            NSMutableString *string = [NSMutableString string];
            
            for (MHConvoreMessage *message in messages) {
                [string appendFormat:@"%@: %@\n", message.user.name, message.message];
            }
            
            self.outputTextView.text = string;
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Events";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
 */

- (void)viewDidUnload
{
    [self setInputField:nil];
    [self setOutputTextView:nil];
	[super viewDidUnload];

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_outputTextView release];
    [_inputField release];
    [_topic release];

    [super dealloc];
}

- (IBAction)sendMessage:(id)sender 
{
    [[ConvalotClient sharedClient] postMessage:self.inputField.text 
                                       inTopic:self.topic.topicId
                                         block:^ (MHConvoreMessage *message, NSError *error) {
                                             if (error) {
                                                 NSLog(@"Report error: %@", error);
                                             }
                                         }];
}

#pragma mark - Public API
- (void)newMessage:(MHConvoreMessage *)message
{
    NSString *string = [self.outputTextView.text stringByAppendingFormat:@"%@: %@\n", message.user.name, message.message];
    self.outputTextView.text = string;
}

@end
