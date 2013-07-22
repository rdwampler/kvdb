//
//  SerializationTestCase.m
//  kvdb
//
//  Created by Colin Young on 2/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SerializationTestCase.h"

#import <UIKit/UIKit.h>
#import "KVDB.h"

@implementation SerializationTestCase

// All code under test is in the iOS Application

- (void)setUp {
    [super setUp];
    
    [[KVDB sharedDB] dropDatabase];
    [[KVDB sharedDB] createDatabase];
}

- (void)testSerialization
{
    NSString *testString = @"Test string is awesome.";
    NSString *testKey = @"test_str_key";
    [[KVDB sharedDB] setValue:testString forKey:testKey];
    
    id obj = [[KVDB sharedDB] valueForKey:testKey];
    STAssertEqualObjects(obj, testString, @"Serialized and deserialized objects are equal.");
}

@end