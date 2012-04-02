//
//  MessagesListViewController.m
//  vkmessenger
//
//  Created by Vanger on 02.04.12.
//  Copyright (c) 2012 Flexis. All rights reserved.
//

#import "MessagesListViewController.h"
#import "ChatCell.h"

@implementation MessagesListViewController

@synthesize toolbar;
@synthesize createMessageBarButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)configureToolBar {
    NSString *kHeaderBackgroundImageName = @"Header.png";
    if([[[UIDevice currentDevice] systemVersion] intValue] >= 5) {
        [toolbar setBackgroundImage:[UIImage imageNamed:kHeaderBackgroundImageName] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        [createMessageBarButton setBackgroundImage:[UIImage imageNamed:@"Header_Button.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else {
        [toolbar insertSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:kHeaderBackgroundImageName]] autorelease] atIndex:0];
    }
    
    UIView *basicView = [toolbar.subviews objectAtIndex:0];
    basicView.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureToolBar];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatCell *cell = (ChatCell *) [tableView dequeueReusableCellWithIdentifier:kChatCellIdentificator];
        
    if (cell == nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil];
        
        cell = [views objectAtIndex:0];
        cell.lastMessageLabel.text = @"bla-lba-bla";
    }

    
    return cell;
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 57;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        [(ChatCell *)cell setContainsUnreadMessages:YES];
    }
}




@end
