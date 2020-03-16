#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {


    int size = [n intValue];
    int iterations = [k intValue];

    unichar str[size];
    [s getCharacters:str range:NSMakeRange(0, size)]; // copy s to str array

    int l = 0;
    int r = size - 1;

    // part 1: make a palindrome

    while (l < r) {
        if (str[l] == str[r]) {
            // do nothing
        } else {
            str[l] = MAX(str[l], str[r]);
            str[r] = MAX(str[l], str[r]);
            iterations--;
        }

        l++;
        r--;
    }

    if (iterations < 0) { // if we exceeded allowed iterations while making palindrome
        return @"-1";
    }

    // part 2: check if we could update some numbers with 9 in while we were making palindrome

    l = 0;
    r = size - 1;

    while (l < r) {
        if ((l == r) && (iterations > 0)) {
            str[l] = '9';
        }

        if (str[l] < '9') {
            if (iterations >= 2 &&
                str[l] == [s characterAtIndex:l] &&
                str[r] == [s characterAtIndex:r]) {

                str[l] = '9';
                str[r] = '9';
                iterations -= 2;
            } else if (iterations >= 1 &&
                (str[l] != [s characterAtIndex:l] || str[r] != [s characterAtIndex:r])) { // концевые участки явно не равны оба одновременно (см пред if), из этого следует, что какой-то из них уже менялся и на это был потрачен k=1 (когда делали палиндром), просто тогда имело смысл поставить не max, а 9;    поэтому мы представляем будто мы тогда поставили там 9 и теперь необходимо лишь второму элементу установить 9;   чтобы переписать историю в прошлом, мы в первый элемент тоже устанавливаем 9;

                str[l] = '9';
                str[r] = '9';
                iterations--;
            }
        }

        l++;
        r--;
    }

    return [NSString stringWithCharacters:str length:size];
}

@end
