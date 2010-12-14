//
//  helloworldViewController.h
//  helloworld
//
//  Created by Robert Diamond on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface helloworldViewController : UIViewController {
	UILabel *helloWorldLabel;
}

@property (nonatomic,assign) IBOutlet UILabel *helloWorldLabel;
@end

