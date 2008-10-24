//
//  IVLocation.h
//  iPhone
//
//  Created by Aubrey Francois on 10/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {kLocationTypeZipcode,kLocationTypeIPhone} IVLocationType;

@interface IVLocation : NSObject {
	NSString* name;
	IVLocationType type;
	bool representsPostalCode;
	NSString* PostalCode;
	double latitude;
	double longitude;
	double accuracy; //meters
}

@end
