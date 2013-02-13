//
//  precalclStateMachine.h
//  precalcl
//
//  Created by 湯尾　志織 on 13/02/13.
//  Copyright (c) 2013年 Shiori Yuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface precalclStateMachine : NSObject{
}

@property double a;
@property double b;
@property double c;
@property double d;
@property int e;
@property int ans;
@property int kei;
@property int p;


- (void)calc;
- (void)math:(int)kai;
- (void)windowSetText:(int)selecter;

@end
