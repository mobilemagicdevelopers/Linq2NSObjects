//
//  SelectorIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "SelectorIteratorTests.h"
#import "NSEnumerator+Linq2NSObjects.h"
#import "RangeIterator.h"

@implementation SelectorIteratorTests

-(void)testSelectorIterator
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    id strings = [rangeIterator select:^id(NSNumber *item) {
        return item.stringValue;
    }];
    
    for (NSString *actualValue in strings)
    {
        NSString *expectedValue = [NSString stringWithFormat:@"%i", start++];
        STAssertTrue([actualValue isEqualToString:expectedValue], @"SelectIterator failed.");
    }
}

@end
