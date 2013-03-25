//
//  SelectorIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "SelectorIterator.h"

@implementation SelectorIterator

-(id)initWithSource:(NSEnumerator *)source andSelector:(Selector)selector
{
    if (self = [super initWithSource:source])
        _selector = selector;
    
    return self;
}

@end
