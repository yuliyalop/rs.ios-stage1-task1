#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int b_act;
    int b_charged = [sum intValue];
    int summa = 0;
    int summa1;
    for (int i = 0; i < [bill count]; i++) {
        summa = [[bill objectAtIndex:i] intValue] + summa;
        
    }
    summa1 = summa - [[bill objectAtIndex:index] intValue];
    
    b_act = summa1/2;
    
    if (b_charged == b_act) {
        return @"Bon Appetit";
        
    } else {
        return [NSString stringWithFormat:@"%d",(b_charged-b_act)];
    }
    

}

@end
