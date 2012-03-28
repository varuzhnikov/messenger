//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKRequest.h"
#import "VKRequestDelegate.h"
#import "ASIHTTPRequest.h"
#import "SBJson.h"


@interface VKRequest ()
@property(nonatomic, readonly) NSString *urlString;

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
    [_urlString release];
    [GETParameters release];
    GETParameters = nil;
    [_delegate release];
    [_responseString release];
    [super dealloc];
}

- (void)setGetParameterWithName:(NSString *)name andValue:(NSString *)value {
    [GETParameters setObject:value forKey:name];
}

- (NSString *)getParameterWithName:(NSString *)name {
    return [GETParameters objectForKey:name];
}

- (void)setResponseString:(NSString *)aResponseString {
    [self replaceResponseString:aResponseString];
    id JSONValue = [_responseString JSONValue];
    NSString *errorDescription = [JSONValue objectForKey:@"error"];
    if (errorDescription != nil) {
        NSDictionary *errorDetails = [NSDictionary dictionaryWithObject:errorDescription forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:@"ru.vkmessanger" code:100 userInfo:errorDetails];
        [self.delegate responseHasError:error];
    } else {
        [self parse];
    }
}

- (void)replaceResponseString:(NSString *)aResponseString {
    [_responseString release];
    _responseString = nil;
    _responseString = [aResponseString retain];
}

- (void)parse {

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
    }
    [self.delegate requestFailed:self];
}

- (void)requestFinished:(id)request {
    if ([request respondsToSelector:@selector(responseString)]) {
        self.responseString = [request responseString];
        NSLog(@"request finished with response: %@", self.responseString);
    }
    [self.delegate requestFinished:self];
}

@end