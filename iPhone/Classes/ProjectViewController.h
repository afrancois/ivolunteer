//
//  RootViewController.h
//  iPhone
//
//  Created by Dave Angulo on 10/18/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectViewController : UITableViewController {
	UIBarButtonItem *filterButton;
	UIBarButtonItem *settingsButton;
}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *filterButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *settingsButton;

- (IBAction)doFilter:(id)sender;
- (IBAction)doSettings:(id)sender;

@end
