//
//  Created by Vitaliy Ruzhnikov on 30.03.12.
//
//
//


@protocol VKErrorNotifier <NSObject>

- (void)notifyWithError:(NSError *)error;

@end