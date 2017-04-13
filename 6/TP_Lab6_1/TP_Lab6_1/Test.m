//
//  Test.m
//  TP_Lab6_1
//
//  Created by Daniel Muraveyko on 08/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "Test.h"

@implementation Test

+(void)test: (NSString*)expected received: (NSString*)received number:(int)num{
    NSLog(@"Test #%d\nExpected: %@\nReceived: %@\nResult: %@", num, expected, received,
          [expected isEqualToString:received] ?  @"PASS\n" : @"FALED\n");
}

@end //Test
