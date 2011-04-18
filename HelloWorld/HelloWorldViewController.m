//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Trevor Reid on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldViewController.h"

#define kUpdateFrequency	60.0
#define kLocalizedPause		NSLocalizedString(@"Pause","pause taking samples")
#define kLocalizedResume	NSLocalizedString(@"Resume","resume taking samples")

@implementation HelloWorldViewController
@synthesize xaccel;
@synthesize zaccel;
@synthesize yaccel;



- (void)dealloc
{

    [xaccel release];
    [yaccel release];
    [zaccel release];
    [yaccel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// UIAccelerometerDelegate method, called when the device accelerates.
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	// Update the accelerometer graph view
	if(!isPaused)
	{
    

        xaccel.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
        yaccel.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
        zaccel.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];

	
	}
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isPaused = YES;
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];

    
}


- (void)viewDidUnload
{

    [self setXaccel:nil];
    [self setYaccell:nil];
    [self setZaccel:nil];
    [self setYaccel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)startReading:(id)sender {

   // self.view.backgroundColor = [UIColor blackColor];
    isPaused = NO;
    
}

- (IBAction)stopReading:(id)sender {
    isPaused = YES;
   
}

@end
