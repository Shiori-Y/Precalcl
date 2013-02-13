//
//  precalclStateMachine.m
//  precalcl
//
//  Created by 湯尾　志織 on 13/02/13.
//  Copyright (c) 2013年 Shiori Yuo. All rights reserved.
//

#import "precalclStateMachine.h"

@implementation precalclStateMachine


@synthesize a;
@synthesize b;
@synthesize c;
@synthesize d;
@synthesize e;
@synthesize ans;
@synthesize kei;
@synthesize p;

-(void)calc{
    //計算
    switch (ans){
        case 1:
            a = a+b;
            break;
        case 2:
            a = a-b;
            break;
        case 3:
            a = a*b;
            break;
        case 4:
            a = a/b;
            break;
    }
    b = 0;
    kei = 0;
}

-(void)math:(int)total{
    if (kei != 0){
        b = 0;
    }
    kei = 1;
    p = 0;
    e = 1;
    ans = total;
}
@end
