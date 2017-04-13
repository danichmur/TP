//
//  NSMutableDictionary.m
//  TP_Lab6_1
//
//  Created by Daniel Muraveyko on 11/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "NSMutableDictionary.h"

@implementation NSMutableDictionary (Utilites)

-(void)addWithFrequency:(NSString*)word{
    NSNumber *repetitions;
    if((repetitions = [self valueForKey:word]) == nil){
        repetitions = [NSNumber numberWithInt: 0];
    }
    repetitions = [NSNumber numberWithInt:[repetitions intValue] + 1];
    [self setObject:repetitions forKey:word];
}

-(int)sortValues:(int)count{
    
    NSArray *sortedKeys = [[self allKeys] sortedArrayUsingSelector: @selector(compare:)];
    NSMutableArray *sortedValues = [NSMutableArray array];
    for (NSString *key in sortedKeys)
        [sortedValues addObject: [self objectForKey: key]];
    
    [self removeAllObjects];
    
    int size = (count > [sortedValues count]) ? (int)[sortedValues count] : count;
    
    for(int i = 0; i < size; i++){
        [self setObject: sortedValues[i] forKey: sortedKeys[i]];
    }
    return size;
}

@end //NSMutableDictionary (AddWithFrequency)



