//
//  VKLoginViewController.h
//  vkmessanger
//
//  Created by Виталий on 03/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "VKLoginScreenDelegate.h"
@class VKLoginScreen;

@interface VKLoginViewController : UIViewController<VKLoginScreenDelegate, UITableViewDataSource>

-(IBAction)loginButtonDidPress:(id)sender;

@property(nonatomic, retain) VKLoginScreen *loginScreen;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UITextField *loginTextField;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end
