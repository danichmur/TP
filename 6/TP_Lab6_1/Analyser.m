//
//  Analyser.m
//  TP_Lab6_1
//
//  Created by Daniel Muraveyko on 08/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "Analyser.h"

@implementation Analyser

+(NSString*) analyse: (NSString *) string{
    int count = 5;
    NSArray *words = [string componentsSeparatedByString:@" "];
    NSMutableDictionary *statistics = [NSMutableDictionary dictionary];
    
    for (NSString* word in words) {
        [statistics addWithFrequency: word];
    }
    
    int size = [statistics sortValues:count];
    
    NSArray *sortedKeysArray =
    [statistics keysSortedByValueUsingComparator:^(id obj1, id obj2) {
        return [obj2 compare:obj1];}];
    
    NSMutableString *received = [NSMutableString new];
    
    for(int i = 0; i < size; i++){
        NSString *s = sortedKeysArray[i];
        [received appendFormat:@"%@: %@ ", s, [statistics objectForKey:s]];
    }
    
    [received deleteCharactersInRange:NSMakeRange([received length]-1, 1)];
    return received;
}

@end //Analyser
