//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


@class VKRequest;

@protocol VKRequestSender<NSObject>
- (void)sendRequest:(VKRequest *)request;

@property(nonatomic, retain) NSString *token;
@end