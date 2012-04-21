//
//  VKLoginViewController.h
//  vkmessanger
//
//  Created by Виталий on 03/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "VKLoginScreenDelegate.h"
#import "VKTextField.h"
@class VKLoginScreen;

@interface VKLoginViewController : UIViewController<VKLoginScreenDelegate, UITableViewDataSource>

-(IBAction)loginButtonDidPress:(id)sender;
-(BOOL) textFieldShouldReturn:(UITextField *) textField;

@property(nonatomic, retain) VKLoginScreen *loginScreen;
@property (retain, nonatomic) IBOutlet VKTextField *passwordTextField;
@property (retain, nonatomic) IBOutlet VKTextField *loginTextField;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end
