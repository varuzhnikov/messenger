//
//  ChatCell.m
//  vkmessenger
//
//  Created by Vanger on 02.04.12.
//  Copyright (c) 2012 Flexis. All rights reserved.
//

#import "ChatCell.h"

NSString *const kChatCellIdentificator = @"ChatCell";

@implementation ChatCell

@synthesize chatImage;
@synthesize chatNameLabel;
@synthesize lastMessageLabel;
@synthesize timeLabel;
@synthesize isOnlineImage;
@synthesize higlightedBackgound;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)setContainsUnreadMessages:(BOOL)isContains {
    if (isContains) {
        self.backgroundColor = [UIColor colorWithRed:235/255.0 
                                               green:240/255.0 
                                                blue:245/255.0 
                                               alpha:1];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setChatName:(NSString *)newName {
    chatNameLabel.text = newName;
}

- (void)setChatImage:(UIImage *)newImage {
    [chatImage setImage:newImage];
}

- (void)setLastMessage:(NSString *)lastMessage {
    lastMessageLabel.text = lastMessage;
}

- (void)setOnlineStatus:(BOOL)isOnline {
    isOnlineImage.hidden = !isOnline;
}

@end
