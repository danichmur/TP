//
//  main.m
//  TP_Lab6_1
//
//  Created by Daniel Muraveyko on 08/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Analyser.h"
#import "Test.h"
#define LINESIZE 300

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* filePath = @"/Users/danielmuraveyko/Google Drive/Obj-C/TP_Lab6/TP_Lab6_1/TP_Lab6_1/tests.txt";
        NSString *myText = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSUTF8StringEncoding error:nil];
        NSArray *lines = [myText componentsSeparatedByString:@"\n"];
        int num = 1;
        for(int i = 0; i < [lines count] - 1; i += 2){
            [Test test:lines[i+1] received:[Analyser analyse: lines[i]] number:num++];
        }
    }
    return 0;
}
