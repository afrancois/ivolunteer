//
//  iPhoneAppDelegate.m
//  iPhone
//
//  Created by Aubrey Francois on 10/18/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "iPhoneAppDelegate.h"



@implementation iPhoneAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize filterView;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	//check the user defaults for firstRun
	NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
	bool hasBeenRun = false;// [def boolForKey:@"ivHasBeenRun"];
	/*
	NSURL* url = [[NSURL alloc] initWithString:@"http://www.1volunteer.org:8080/server/resources/organizations/list/"];
	NSURLRequest* req = [[NSURLRequest alloc] initWithURL:url];
	NSError* err = [[NSError alloc] init];
	NSURLResponse* resp = [[NSURLResponse alloc] init];
	
	NSString* data = [[NSString alloc] initWithData:[NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:&err] encoding:NSUTF8StringEncoding];
	[req release];
	[err release];
	[resp release];
	
	//NSDictionary* jsondata = [data JSONValue];
	//NSLog(@"%@",[jsondata objectForKey:@"organizations"]);
	*/
	[def setBool:true forKey:@"ivHasBeenRun"];
	
	if(!hasBeenRun){
		//load the splash screen
		splashvc = [[SplashViewController alloc] initWithNibName:@"SplashView" bundle:[NSBundle mainBundle]];
		splashvc.delegate = self;
		[window addSubview:[splashvc view]];
	} else {
		//we call doFilterDone to make the first screen the project screen. (but only if we're run before. otherwise we go to the filter screen.)
		[filterView doFilterDone:self];
		[self loadNavigationView];
	}
	
	[window makeKeyAndVisible];
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

-(void) loadNavigationView
{
	[[splashvc view] removeFromSuperview];
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window setNeedsDisplay];	
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

-(void) splashDidDoOk
{
	[self loadNavigationView];
}
	
		
									   
@end
