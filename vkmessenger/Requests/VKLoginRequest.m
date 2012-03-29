//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKLoginRequest.h"
#import "SBJson.h"


@implementation VKLoginRequest {

@private
    NSString *_token;
}
@synthesize token = _token;


- (id)init {
    self = [super initWithUrlString:GET_TOKEN_URL];
    if (self) {
        [self setGetParameterWithName:GRANT_TYPE_PARAM_NAME andValue:@"password"];
        [self setGetParameterWithName:CLIENT_ID_PARAM_NAME andValue:@"2848091"];
        [self setGetParameterWithName:CLIENT_SECRET_PARAM_NAME andValue:@"wbim5pRU1CHfFpZytzbD"];
        [self setGetParameterWithName:SCOPE_PARAM_NAME andValue:@"messages"];
    }

    return self;
}


- (id)initWithLogin:(NSString *)login andPassword:(NSString *)password {
    self = [self init];
    if (self) {
        [self setLogin:login];
        [self setPassword:password];
    }
    return self;
}

- (void)setLogin:(NSString *)login {
    [self setGetParameterWithName:USERNAME_PARAM_NAME andValue:login];
}

-(NSString*)login {
    NSString *result =[self getParameterWithName:USERNAME_PARAM_NAME];
    return result;
}

- (NSString*)password {
    NSString *result = [self getParameterWithName:PASSWORD_PARAM_NAME];
    return result;
}

- (void)setPassword:(NSString *)password {
    [self setGetParameterWithName:PASSWORD_PARAM_NAME andValue:password];
}

- (void)dealloc {
    [_token release];
    _token = nil;
    [super dealloc];
}

- (void)parse {
    id jsonValue = [self.responseString JSONValue];
    _token = [[jsonValue objectForKey:TOKEN_PARAM_NAME] retain];
}

@end