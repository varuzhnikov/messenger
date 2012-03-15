//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import <Foundation/Foundation.h>

static NSString *const GET_PARAMETERS_DELIMETER = @"?";
static NSString *const HTTP_GET_PARAMS_DELIMETER = @"&";


@interface VKRequest : NSObject

- (id)initWithUrlString:(NSString *)urlString;


- (void)setGetParameterWithName:(NSString *)name andValue:(NSString *)value;


- (NSString *)getParameterWithName:(NSString *)name;

@property(readonly) NSURL* url;

@end