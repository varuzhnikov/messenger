//
//  Created by Vitaliy Ruzhnikov on 30.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKErrorNotifier.h"


@interface VKErrorNotifierStub : NSObject<VKErrorNotifier>

@property(nonatomic, retain) NSError *lastError;


@end