//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Trevor Reid on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UIAccelerometerDelegate>
{
    BOOL isPaused;
    UILabel *xaccel;
    UILabel *zaccel;
    UILabel *yaccel;
}
@property (nonatomic, retain) IBOutlet UILabel *xaccel;
@property (nonatomic, retain) IBOutlet UILabel *zaccel;
@property (nonatomic, retain) IBOutlet UILabel *yaccel;


- (IBAction)startReading:(id)sender;
- (IBAction)stopReading:(id)sender;

@end
