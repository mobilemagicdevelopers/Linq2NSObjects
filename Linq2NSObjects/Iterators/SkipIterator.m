//
//  SkipIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "SkipIterator.h"

@implementation SkipIterator

-(id)nextObject
{
    id result = [_source nextObject];
    while (result && _count--)
        result = [_source nextObject];
    
    return result;
}

@end
