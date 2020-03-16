#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString *> *)parseString:(NSString *)string {
    NSMutableArray <NSString *> *result = [NSMutableArray new];

    unichar character;
    unichar character_;

    NSMutableArray *stack1 = [NSMutableArray new]; // [
    NSMutableArray *stack2 = [NSMutableArray new]; // <
    NSMutableArray *stack3 = [NSMutableArray new]; // (


    for (int i = 0; i < [string length] - 1; i++) {
        character = [string characterAtIndex:i];

        if (character == '[' || character == '<' || character == '(') {
            if (character == '[') {
                [stack1 addObject:@(i)];
            }

            if (character == '<') {
                [stack2 addObject:@(i)];
            }

            if (character == '(') {
                [stack3 addObject:@(i)];
            }

            for (int j = i + 1; j < [string length]; j++) {
                character_ = [string characterAtIndex:j];

                if (character == '[' && character_ == '[') {
                    [stack1 addObject:@(i)];
                }

                if (character == '<' && character_ == '<') {
                    [stack2 addObject:@(i)];
                }

                if (character == '(' && character_ == '(') {
                    [stack3 addObject:@(i)];
                }

                if (character == '[' && character_ == ']') {
                    [stack1 removeObjectAtIndex:[stack1 count] - 1];
                    if ([stack1 count] == 0) {
                        NSString *str = [string substringWithRange:NSMakeRange(i + 1, j - i - 1)];
                        [result addObject: str];
                        break;
                    }
                }

                if (character == '<' && character_ == '>') {
                    [stack2 removeObjectAtIndex:[stack2 count] - 1];
                    if ([stack2 count] == 0) {
                        NSString *str = [string substringWithRange:NSMakeRange(i + 1, j - i - 1)];
                        [result addObject: str];
                        break;
                    }
                }

                if (character == '(' && character_ == ')') {
                    [stack3 removeObjectAtIndex:[stack3 count] - 1];
                    if ([stack3 count] == 0) {
                        NSString *str = [string substringWithRange:NSMakeRange(i + 1, j - i - 1)];
                        [result addObject: str];
                        break;
                    }
                }
            }

            [stack1 removeAllObjects];
            [stack2 removeAllObjects];
            [stack3 removeAllObjects];
        }
    }

    return [result copy];
}

@end
