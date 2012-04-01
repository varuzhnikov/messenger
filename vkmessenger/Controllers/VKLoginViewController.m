//
//  VKLoginViewController.m
//  vkmessanger
//
//  Created by Виталий on 03/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VKLoginViewController.h"
#import "VKApplicationController.h"
#import "OxICContainer.h"
#import "VKLoginScreen.h"

@implementation VKLoginViewController {
@private
    VKLoginScreen *_loginScreen;
    UIActivityIndicatorView *_spinner;
}

IoCName(loginViewController)
IoCSingleton

IoCInject(loginScreen, loginScreen)
@synthesize loginScreen = _loginScreen;
@synthesize passwordTextField = _passwordTextField;
@synthesize loginTextField = _loginTextField;
@synthesize spinner = _spinner;


- (id)init {
    self = [self initWithNibName:NSStringFromClass([VKLoginViewController class]) bundle:nil];
    if (self) {

    }

    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setLoginScreen:(VKLoginScreen *)aLoginScreen {
    [_loginScreen release];
    _loginScreen = [aLoginScreen retain];
    _loginScreen.delegate = self;
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
    [self setLoginTextField:nil];
    [self setPasswordTextField:nil];
    self.spinner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginButtonDidPress:(id)sender {
    NSLog(@"username :%@", self.loginTextField.text);
    NSLog(@"password :%@", self.passwordTextField.text);
    [self.loginScreen enteredLogin:self.loginTextField.text andPassword:self.passwordTextField.text];
}

- (void)enterInApplication {
    VKApplicationController *vkApplicationController = [[VKApplicationController alloc] initWithNibName:@"VKApplicationController" bundle:nil];
    self.view.window.rootViewController = vkApplicationController;
    [self.view removeFromSuperview];
    [vkApplicationController release];
}

- (void)stopWait {
   [self.spinner stopAnimating];
}

- (void)startWait {
   [self.spinner startAnimating];
}

- (void)dealloc {
    [_loginScreen release];
    _loginScreen = nil;
    self.loginTextField = nil;
    self.passwordTextField = nil;
    self.spinner = nil;
    [super dealloc];
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: make const
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background@2x.png"]];

    NSString *kLoginViewCellIdentifier = @"login view cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLoginViewCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLoginViewCellIdentifier] autorelease];
        
        if (indexPath.row == 0) {
            [cell addSubview:self.loginTextField];
        } else {
            [cell addSubview:self.passwordTextField];
        }
    }
    
    return cell;
}


@end
