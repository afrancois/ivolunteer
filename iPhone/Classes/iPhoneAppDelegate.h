//
//  iPhoneAppDelegate.h
//  iPhone
//
//  Created by Aubrey Francois on 10/18/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSON/JSON.h>
#import "SplashViewController.h"
#import "FilterViewController.h"
#import "ProjectViewController.h"


@interface iPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	FilterViewController *filterView;
	SplashViewController *splashvc;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet FilterViewController *filterView;

-(void) loadNavigationView;
-(void) splashDidDoOk;
@end

