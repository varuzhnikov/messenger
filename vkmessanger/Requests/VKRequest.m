//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKRequest.h"


@interface VKRequest ()
@property(nonatomic, readonly) NSString *urlString;

- (void)addAllGETParams:(NSMutableString *)resultURL;

- (void)removeLastHttpGETDelimiter:(NSMutableString *)resultURL;

- (BOOL)hasNotGETParams;


@end

@implementation VKRequest {

@private
    NSString *_urlString;
    NSMutableDictionary *GETParameters;
}


@synthesize urlString = _urlString;

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
    [super dealloc];
}

- (void)setGetParameterWithName:(NSString *)name andValue:(NSString *)value {
    [GETParameters setObject:value forKey:name];
}

- (NSString *)getParameterWithName:(NSString *)name {
    return [GETParameters objectForKey:name];
}

- (NSURL *)url {
    NSMutableString *resultURL = [NSMutableString stringWithString:self.urlString];
    
    if ([self hasNotGETParams]) {
        return [NSURL URLWithString:self.urlString];
    }
    
    [self addAllGETParams:resultURL];

    return [NSURL URLWithString:resultURL];
}

- (void)addAllGETParams:(NSMutableString *)resultURL {
    [resultURL appendString:GET_PARAMETERS_DELIMETER];

    for (NSString *name in [GETParameters allKeys]) {
        [resultURL appendString:[NSString stringWithFormat:@"%@=%@", name, [GETParameters objectForKey:name]]];
        [resultURL appendString:HTTP_GET_PARAMS_DELIMETER];
    }
    [self removeLastHttpGETDelimiter:resultURL];
}


- (void)removeLastHttpGETDelimiter:(NSMutableString *)resultURL {
    NSRange range = NSMakeRange([resultURL length] - 1, 1);
    [resultURL deleteCharactersInRange:range];
}

- (BOOL)hasNotGETParams {
    return [GETParameters count] == 0;
}

@end