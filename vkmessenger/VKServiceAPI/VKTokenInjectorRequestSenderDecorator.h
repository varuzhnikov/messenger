//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequestSender.h"


@interface VKTokenInjectorRequestSenderDecorator : NSObject <VKRequestSender>
- (id)initWithDelegate:(id <VKRequestSender>)delegate;

@property(nonatomic, retain) id <VKRequestSender> delegate;

@end