//
//  FilterViewController.h
//  iPhone
//
//  Created by Aubrey Francois on 10/19/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectViewController.h"

@interface FilterViewController : UIViewController {
	ProjectViewController* projectView;
}

@property (nonatomic,retain) ProjectViewController *projectView;

- (IBAction) doFilterDone:(id)sender;

@end
