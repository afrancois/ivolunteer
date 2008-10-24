//
//  SplashViewController.m
//  iPhone
//
//  Created by Aubrey Francois on 10/18/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"


@implementation SplashViewController
@synthesize delegate;
@synthesize title;
@synthesize button;

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
	[UIView beginAnimations:@"slideup" context:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDone:finished:context:)];
	CGRect target = CGRectMake(self.title.frame.origin.x,10,self.title.frame.size.width,self.title.frame.size.height);
	self.title.frame = target;
	[UIView commitAnimations];
}


-(void)animationDone:(NSString*)animId finished:(NSNumber*)completed context:(void*)context
{
	self.button.hidden = false;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)splashOk:(id)sender forEvent:(UIEvent*)event
{
	if([delegate respondsToSelector:@selector(splashDidDoOk)])
	{
		[delegate performSelector:@selector(splashDidDoOk) withObject:nil afterDelay:0];
	}
}

@end
