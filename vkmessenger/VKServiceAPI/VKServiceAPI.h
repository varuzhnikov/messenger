//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


@class VKRequest;

@protocol VKServiceAPI
- (void)sendRequest:(VKRequest *)request;

@property(nonatomic, retain) NSString *token;
@end