//
//  VKAppDelegate.m
//  vkmessanger
//
//  Created by Виталий on 10.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VKAppDelegate.h"

#import "Controllers/VKLoginViewController.h"
#import "OxICXmlContainerBuilder.h"
#import "OxICSimpleWrapperFactory.h"
#import "ServiceExecutor.h"

@implementation VKAppDelegate {
@private
    OxICContainer *_container;
}


@synthesize window = _window;
@synthesize container = _container;


- (void)dealloc {
    [_window release];
    [_container release];
    [super dealloc];
}

- (void)buildContainerFromCodeAutoInject {

    OxICSimpleWrapperFactory *wrapperFactory = [[OxICSimpleWrapperFactory alloc] init];
    OxICContainer *autoInjectContainer = [[OxICContainer alloc] initWithWrapperFactory:wrapperFactory];
    self.container = autoInjectContainer;

    [autoInjectContainer release];
    [wrapperFactory release];

    [self.container addDefinitionFromClassName:@"ExampleServiceImpl"];

    [self.container addDefinitionFromClassName:@"ServiceExecutorImpl"];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    UIViewController *loginViewController = [[[VKLoginViewController alloc] initWithNibName:@"VKLoginViewController" bundle:nil] autorelease];

    [self buildContainerFromCodeAutoInject];

    //call to factory
    // theExecutor: ServiceExecutorImpl2
    // theService: ExampleServiceImpl1
    id <ServiceExecutor> executorFromCodeAutoInject = [self.container getObject:@"theExecutor"];

    // this executor has an ExampleServiceImpl1 in service property.
    [executorFromCodeAutoInject executeService];

    self.window.rootViewController = loginViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
