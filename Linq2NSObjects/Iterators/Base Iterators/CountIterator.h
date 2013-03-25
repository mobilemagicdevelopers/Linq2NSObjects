//
//  CountIterator.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "Iterator.h"

@interface CountIterator : Iterator {
    @protected
    int _count;
}

-initWithSource:(NSEnumerator *)source andCount:(int)count;

@end
