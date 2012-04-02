//
//  MessagesListViewController.h
//  vkmessenger
//
//  Created by Vanger on 02.04.12.
//  Copyright (c) 2012 Flexis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessagesListViewController : UIViewController <UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *createMessageBarButton;

@end
