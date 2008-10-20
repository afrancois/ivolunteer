//
//  FilterViewController.m
//  iPhone
//
//  Created by Aubrey Francois on 10/19/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FilterViewController.h"
#import "ProjectViewController.h"

@implementation FilterViewController

@synthesize projectView;

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically.
/*
- (void)loadView {
	
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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

- (IBAction) doFilterDone:(id)sender
{
	//if we haven't created a projectView, we create one
	if(self.projectView == nil)
	{
		ProjectViewController* _projectView = [[ProjectViewController alloc] initWithNibName:@"ProjectViewController" bundle:[NSBundle mainBundle]];
		self.projectView = _projectView;
		[_projectView release];
	}
	//add the view to the heirarchy.
	[self.navigationController pushViewController:projectView animated:YES];
}

@end
