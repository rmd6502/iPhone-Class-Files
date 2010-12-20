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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	animCount = 0;
	state = 0;
}


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
	if (animCount > 0) {
		return;
	}
	animCount = 2;
	state = 1;
	CATransition *trans = [[CATransition alloc] init];
	CATransition *trans2 = [[CATransition alloc] init];
	trans.duration=.5;
	trans.type = kCATransitionMoveIn;
	trans.subtype = kCATransitionFromRight;
	trans.delegate = self;
	trans2.duration=.5;
	trans2.type = kCATransitionFade;
	trans2.subtype = kCATransitionFromRight;
	trans2.delegate = self;
	[CATransaction begin];
	[helloWorldLabel.layer addAnimation:trans forKey:@"ChangeTextKey"];
	[self.view.layer addAnimation:trans2 forKey:@"Changebg"];
	self.view.backgroundColor = [UIColor colorWithRed:.9 green:.6 blue:.5 alpha:1.0];
	helloWorldLabel.text=@"Goodbye, cruel world";
	[CATransaction commit];
	[trans release];[trans2 release];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	if (--animCount == 0 && state == 1) {
		animCount = 1;
		state = 0;
		[self performSelector:@selector(delayedRestoreScreen) withObject:nil afterDelay:1.0];
	}
}

- (void)delayedRestoreScreen {
	CATransition *trans = [[CATransition alloc] init];
	trans.duration=.125;
	trans.type = kCATransitionFade;
	trans.subtype = kCATransitionFromRight;
	trans.delegate = self;
	
	[CATransaction begin];
	[self.view.layer addAnimation:trans forKey:@"Changebg"];
	helloWorldLabel.text=@"Hello, world";
	self.view.backgroundColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1.0];
	[CATransaction commit];
	[trans release];
}

@end
