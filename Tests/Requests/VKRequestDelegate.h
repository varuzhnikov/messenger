//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


@class VKRequest;

@protocol VKRequestDelegate <NSObject>

- (void)requestFailed:(VKRequest *)request;

- (void)requestFinished:(VKRequest *)request;

@end