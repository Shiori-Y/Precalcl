//
//  precalclTests.m
//  precalclTests
//
//  Created by 湯尾　志織 on 12/10/23.
//  Copyright (c) 2012年 Shiori Yuo. All rights reserved.
//

#import "precalclTests.h"

@implementation precalclTests
@synthesize statemachine;

- (void)setUp
{
    [super setUp];
    statemachine = [[precalclStateMachine alloc]init];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //それぞれの場合についてテストを行う
    //和算についてのテスト
    statemachine.a = 2;
    statemachine.b = 3.5;
    statemachine.ans = 1;
    [statemachine calc];
    STAssertEqualsWithAccuracy(5.5, statemachine.a, 0.00001, @"error");
    
    statemachine.a = -1;
    statemachine.b = -1;
    statemachine.ans = 1;
    [statemachine calc];
    STAssertEqualsWithAccuracy(-2.0, statemachine.a, 0.00001, @"error");
    
    //減算についてのテスト
    statemachine.a = 3.1;
    statemachine.b = 2;
    statemachine.ans = 2;
    [statemachine calc];
    STAssertEqualsWithAccuracy(1.1, statemachine.a, 0.00001, @"error");
    
    statemachine.a = -4;
    statemachine.b = -5;
    statemachine.ans = 2;
    [statemachine calc];
    STAssertEqualsWithAccuracy(1, statemachine.a, 0.00001, @"error");
    
    //乗算についてのテスト
    statemachine.a = 2.5;
    statemachine.b = 2;
    statemachine.ans = 3;
    [statemachine calc];
    STAssertEqualsWithAccuracy(5, statemachine.a, 0.00001, @"error");
    
    statemachine.a = -3;
    statemachine.b = -2;
    statemachine.ans = 3;
    [statemachine calc];
    STAssertEqualsWithAccuracy(6, statemachine.a, 0.00001, @"error");
    
    //除算についてのテスト
    statemachine.a = 6.9;
    statemachine.b = 3;
    statemachine.ans = 4;
    [statemachine calc];
    STAssertEqualsWithAccuracy(2.3, statemachine.a, 0.00001, @"error");
    
    statemachine.a = -9;
    statemachine.b = 2;
    statemachine.ans = 4;
    [statemachine calc];
    STAssertEqualsWithAccuracy(-4.5, statemachine.a, 0.00001, @"error");
}

@end
