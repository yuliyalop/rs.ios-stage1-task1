#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    int prev;
    int next;
    int curr;
    
    NSMutableArray *lolo = [NSMutableArray arrayWithArray:sadArray];
    if ([lolo count] == 0) {
        return sadArray;
    }
    bool badElementsPresent = true;
    while (badElementsPresent){
        badElementsPresent = false;
        
        for (int i = 1; i < [lolo count] - 1; i++) {
            curr = [[lolo objectAtIndex:i] intValue]  ;
            prev = [[lolo objectAtIndex:i-1] intValue];
            next = [[lolo objectAtIndex:i+1] intValue];
            
            if (curr > (prev + next)) {
                badElementsPresent = true;
                [lolo removeObjectAtIndex:i];
            }
            
        }
    }
    
    NSArray *lolo1 = [NSArray arrayWithArray:lolo];
    return lolo1;
}

@end
