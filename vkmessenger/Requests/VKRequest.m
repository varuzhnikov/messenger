//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKRequest.h"
#import "VKRequestDelegate.h"
#import "SBJson.h"


@interface VKRequest ()
@property(nonatomic, readonly) NSString *urlString;

- (BOOL)isErrorInResponse;

- (void)parseErrorFromResponse;


- (BOOL)isErrorDescriptionPresent;

- (void)replaceResponseString:(NSString *)aResponseString;

- (void)addAllGETParamsTo:(NSMutableString *)resultURL;

- (void)removeLastHttpGETDelimiterFrom:(NSMutableString *)resultURL;

- (BOOL)hasNotGETParams;


@end

@implementation VKRequest {

@private
    NSString *_urlString;
    NSMutableDictionary *GETParameters;
    id <VKRequestDelegate> _delegate;
    NSString *_responseString;
}


@synthesize urlString = _urlString;
@synthesize delegate = _delegate;
@synthesize responseString = _responseString;
@synthesize responseError = _responseError;


- (id)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        _urlString = [urlString copy];
        GETParameters = [[NSMutableDictionary alloc] init];
    }

    return self;
}

- (void)dealloc {
    [_urlString release];
    _urlString = nil;
    [GETParameters release];
    GETParameters = nil;
    [_delegate release];
    [_responseString release];
    [_responseError release];
    [super dealloc];
}

- (void)setGetParameterWithName:(NSString *)name andValue:(NSString *)value {
    [GETParameters setObject:value forKey:name];
}

- (NSString *)getParameterWithName:(NSString *)name {
    return [GETParameters objectForKey:name];
}

- (void)setResponseString:(NSString *)aResponseString {
    NSLog(@"Response from server :%@", aResponseString);
    [self replaceResponseString:aResponseString];
    if ([self isErrorInResponse]) {
        [self parseErrorFromResponse];
    } else {
        [self parse];
    }
}

- (BOOL)isErrorInResponse {
    id JSONValue = [_responseString JSONValue];
    NSString *errorKey = [JSONValue objectForKey:ERROR_KEY];
    return (errorKey != nil);
}

- (void)parseErrorFromResponse {
    id JSONValue = [_responseString JSONValue];
    NSString *errorKey = [JSONValue objectForKey:ERROR_KEY];
    NSMutableDictionary *errorDetails = [NSMutableDictionary dictionaryWithObject:errorKey forKey:ERROR_KEY];

    if ([self isErrorDescriptionPresent]) {
        NSString *errorDescription = [JSONValue objectForKey:ERROR_DESCRIPTION_KEY];
        [errorDetails setObject:errorDescription forKey:NSLocalizedDescriptionKey];
    }

    NSError *error = [NSError errorWithDomain:@"ru.vkmessanger" code:100 userInfo:errorDetails];
    self.responseError = error;
}

- (BOOL)isErrorDescriptionPresent {
    id JSONValue = [_responseString JSONValue];
    NSString *errorDescription = [JSONValue objectForKey:ERROR_DESCRIPTION_KEY];
   return errorDescription !=nil;
}


- (void)replaceResponseString:(NSString *)aResponseString {
    [_responseString release];
    _responseString = nil;
    _responseString = [aResponseString retain];
}

- (void)parse {

}

- (NSURL *)baseUrl {
    return [NSURL URLWithString:self.urlString];
}

- (NSURL *)url {
    NSMutableString *resultURL = [NSMutableString stringWithString:self.urlString];

    if ([self hasNotGETParams]) {
        return [NSURL URLWithString:self.urlString];
    }

    [self addAllGETParamsTo:resultURL];

    return [NSURL URLWithString:resultURL];
}

- (void)addAllGETParamsTo:(NSMutableString *)resultURL {
    [resultURL appendString:GET_PARAMETERS_DELIMETER];

    for (NSString *name in [GETParameters allKeys]) {
        NSString *paramValue = [GETParameters objectForKey:name];
        NSString *encodedParamValue = [paramValue stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [resultURL appendString:[NSString stringWithFormat:@"%@=%@", name, encodedParamValue]];
        [resultURL appendString:HTTP_GET_PARAMS_DELIMETER];
    }
    [self removeLastHttpGETDelimiterFrom:resultURL];
}


- (void)removeLastHttpGETDelimiterFrom:(NSMutableString *)resultURL {
    NSRange range = NSMakeRange([resultURL length] - 1, 1);
    [resultURL deleteCharactersInRange:range];
}

- (BOOL)hasNotGETParams {
    return [GETParameters count] == 0;
}

- (void)requestFailed:(id)request {
    if ([request respondsToSelector:@selector(responseString)]) {
        self.responseString = [request responseString];
        NSLog(@"request failed with response: %@", self.responseString);

        [self.delegate requestFailed:self];
    }
}

- (void)requestFinished:(id)request {
    if ([request respondsToSelector:@selector(responseString)]) {
        self.responseString = [request responseString];
        NSLog(@"request finished with response: %@", self.responseString);

        [self.delegate requestFinished:self];
    }
}

@end