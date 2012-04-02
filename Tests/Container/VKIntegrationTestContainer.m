//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKIntegrationTestContainer.h"
#import "VKSyncRequestSender.h"


@implementation VKIntegrationTestContainer {

}

- (id)init {
    self = [super init];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKSyncRequestSender class])];
    }

    return self;
}


@end