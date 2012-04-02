//
//  ChatCell.h
//  vkmessenger
//
//  Created by Vanger on 02.04.12.
//  Copyright (c) 2012 Flexis. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kChatCellIdentificator;

@interface ChatCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *chatImage;
@property (retain, nonatomic) IBOutlet UILabel *chatNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *lastMessageLabel;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIImageView *isOnlineImage;
@property (retain, nonatomic) IBOutlet UIImageView *higlightedBackgound;

- (void)setContainsUnreadMessages:(BOOL)isContains;


@end
