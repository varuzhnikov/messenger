//
//  Created by Vitaliy Ruzhnikov on 18.03.12.
//
//
//


@class VKRequest;

@protocol VKRequestFactory<NSObject>

- (VKRequest *)createLoginRequestWithUsername:(NSString *)username andPasword:(NSString *)password;

@end