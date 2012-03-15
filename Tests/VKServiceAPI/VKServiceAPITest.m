//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import "VKServiceAPITest.h"
#import "ASIHTTPRequest.h"
#import "VKServiceAPI.h"


@implementation VKServiceAPITest {

}

- (void)setUp {
    [super setUp];
}

-(void) testGetAccessToken{
    NSString *password = [@"password" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *clientID = [@"2848091" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *client_secret = [@"wbim5pRU1CHfFpZytzbD" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *username = [@"denis.tarazanov@gmail.com" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *userPassword = [@"_Gu^iL@D"  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *scope = [@"messages" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSString *urlString = [NSString stringWithFormat:@"https://api.vk.com/oauth/token?grant_type=%@&client_id=%@&client_secret=%@&username=%@&password=%@&scope=%@"
    , password, clientID, client_secret, username, userPassword, scope ];
    NSLog(@"urlString : %@", urlString);


    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];

	[request setDelegate:self];

	[request startSynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)aRequest {

	NSLog(@"response string %@",[aRequest responseString]);
}

-(void)requestDidFail:(id) aRequest{

	GHAssertTrue(NO,@"Request failted");
}

@end