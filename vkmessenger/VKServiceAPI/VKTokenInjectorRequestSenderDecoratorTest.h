//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>
#import "VKRequestSender.h"

@class VKRequest;
@class VKTokenInjectorRequestSenderDecorator;
static NSString *const TEST_TOKEN = @"test_token";


@interface VKTokenInjectorRequestSenderDecoratorTest : SenTestCase<VKRequestSender>

@property(nonatomic, retain) VKRequest *request;
@property(nonatomic, retain) VKTokenInjectorRequestSenderDecorator *decorator;


@end