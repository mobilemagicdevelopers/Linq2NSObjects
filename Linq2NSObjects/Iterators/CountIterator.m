//
//  CountIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "CountIterator.h"

@implementation CountIterator

-(id)initWithSource:(NSEnumerator *)source andCount:(int)count
{
    if (self = [super initWithSource:source])
        _count = count;
    
    return self;
}

@end
