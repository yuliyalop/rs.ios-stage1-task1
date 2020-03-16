#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    if ([array count] == 0) {
        return array;
    }

    int min = INT_MAX;
    int max = 0;
    int sum = 0;

    for (int i = 0; i < [array count]; i++) { // numbers to skip

        sum = 0;
        for (int j = 0; j < [array count]; j++) { // numbers to sum
            if (j == i) {
                // skip
            } else {
                sum = sum + [array[j] intValue];
            }
        }

        if (sum < min) {
            min = sum;
        }

        if (sum > max) {
            max = sum;
        }
    }

    return @[ [NSNumber numberWithInt: min], [NSNumber numberWithInt: max] ];
}

@end

