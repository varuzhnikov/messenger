//
//  VKLoginViewController.m
//  vkmessanger
//
//  Created by Виталий on 03/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VKLoginViewController.h"
#import "VKSecondViewController.h"
#import "VKFirstViewController.h"
#import "VKApplicationController.h"

@implementation VKLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginButtonDidPress:(id)sender {
    VKApplicationController *vkApplicationController = [[VKApplicationController alloc] initWithNibName:@"VKApplicationController" bundle:nil];
    self.view.window.rootViewController = vkApplicationController;
    [self.view removeFromSuperview];
    [vkApplicationController release];
}


@end
