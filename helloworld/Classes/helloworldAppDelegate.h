//
//  helloworldAppDelegate.h
//  helloworld
//
//  Created by Robert Diamond on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class helloworldViewController;

@interface helloworldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    helloworldViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet helloworldViewController *viewController;

@end

