//
//  IVFilter.h
//  iPhone
//
//  Created by Aubrey Francois on 10/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IVLocation.h"

@interface IVFilter : NSObject {
	int idInDatabase;
	NSMutableArray *interestAreas;
	NSMutableArray *organizationTypes;
	float distance;
	float timeframe;
	IVLocation* location;
}

- (void) setCurrentLocation:(IVLocation*) aLocation;


@end
