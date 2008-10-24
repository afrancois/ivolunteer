//
//  SplashViewController.h
//  iPhone
//
//  Created by Aubrey Francois on 10/18/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SplashViewController : UIViewController {
	id delegate;
	UIView* title;
	UIButton* button;
}

@property (nonatomic,retain) id delegate;
@property (nonatomic,retain) IBOutlet UIView* title;
@property (nonatomic,retain) IBOutlet UIButton* button;

- (IBAction)splashOk:(id)sender forEvent:(UIEvent*)event;
-(void)animationDone:(NSString*)animId finished:(NSNumber *)completed context:(void*)context;
@end
