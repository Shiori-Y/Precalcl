//
//  precalclViewController.h
//  precalcl
//
//  Created by 湯尾　志織 on 12/10/23.
//  Copyright (c) 2012年 Shiori Yuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "precalclStateMachine.h"

@interface precalclViewController : UIViewController{
//    IBOutlet UILabel *label;
//    BOOL startInput;
//    double currentValue;
//    int operation;
}

@property precalclStateMachine* model;

//- (IBAction)number:(id)sender;
//数値をボタンごとに分ける
- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)point:(id)sender;


- (IBAction)clear:(id)sender;
- (IBAction)equal:(id)sender;

//- (IBAction)op:(id)sender;
//演算子をボタンごとにわける
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)divide:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *window;

- (void)math:(int)total;
- (void)windowSetText:(int)selecter;


@end
