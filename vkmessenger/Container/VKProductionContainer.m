//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKProductionContainer.h"
#import "VKAsyncRequestSender.h"


@implementation VKProductionContainer {

}
- (id)init {
    self = [super init];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKAsyncRequestSender class])];
    }

    return self;
}


@end