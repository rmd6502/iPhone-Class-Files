//
//  helloworldViewController.m
//  helloworld
//
//  Created by Robert Diamond on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "helloworldViewController.h"

@implementation helloworldViewController

@synthesize helloWorldLabel;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesended: %@", event);
	CATransition *trans = [[CATransition alloc] init];
	trans.duration=.5;
	trans.type = kCATransitionMoveIn;
	trans.subtype = kCATransitionFromRight;
	[CATransaction begin];
	[helloWorldLabel.layer addAnimation:trans forKey:@"ChangeTextKey"];
	helloWorldLabel.text=@"Goodbye, world";
	[CATransaction commit];
}

@end
