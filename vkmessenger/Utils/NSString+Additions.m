//
//  Created by Vitaliy Ruzhnikov on 20.04.12.
//
//
//


#import "NSString+Additions.h"


@implementation NSString (Additions)

- (BOOL)isEmpty {
    if ([self isEqualToString:@""]) {
        return YES;
    }
    return NO;
}


+ (BOOL)isEmpty:(NSString *)string {
    if (string == nil) {
        return YES;
    }

    if ([string isEmpty]) {
        return YES;
    }

    return NO;

}


@end