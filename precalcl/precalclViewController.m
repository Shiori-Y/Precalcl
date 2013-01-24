//
//  precalclViewController.m
//  precalcl
//
//  Created by 湯尾　志織 on 12/10/23.
//  Copyright (c) 2012年 Shiori Yuo. All rights reserved.
//

#import "precalclViewController.h"

@interface precalclViewController ()

@end

@implementation precalclViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    startInput   = YES;
    currentValue = 0;
}

- (IBAction)number:(id)sender {
    UIButton *b = (UIButton *)sender;
    
    if( startInput ){
        //最初の一桁目が０なら表示しない
        if( b.tag == 0 ) return;
        if( b.tag == 10 ){
            label.text = [NSString stringWithFormat:@"0."];
        }
        else{
            //新しく表示する文字列を作成
            label.text = [NSString stringWithFormat:@"%d", b.tag];
        }
        startInput = NO;
    }
    else{
        //すでに表示されている文字列に連結
        if( b.tag == 10 ){
            //"."ならばすでに"."がないかチェック
            NSRange searchResult = [label.text rangeOfString:@"."];
            if(searchResult.location == NSNotFound){
                label.text = [NSString stringWithFormat:@"%@%@",label.text,@"."];
            }
        }
        else{
        label.text = [NSString stringWithFormat:@"%@%d", label.text, b.tag];
        }
    }
}
    
- (IBAction)equal:(id)sender {
    //直前に押された演算子で場合分け
    
    if (operation == -1)return;
    if (operation == 0){
        currentValue += [label.text doubleValue];
    } else if( operation == 1 ){
        currentValue -= [label.text doubleValue];
    } else if( operation == 2 ){
        currentValue *= [label.text doubleValue];
    } else if( operation == 3 ){
        currentValue /= [label.text doubleValue];
    }
    //表示の更新
    label.text = [NSString stringWithFormat:@"%g", currentValue];
        startInput = YES;
        operation = -1;
}
    
- (IBAction)op:(id)sender {
    UIButton *b = (UIButton *)sender;
    //現在値の保存
    currentValue = [label.text doubleValue];
    //演算の保存
    operation = b.tag;
    startInput = YES;
}

- (IBAction)clear:(id)sender {
     UIButton *b = (UIButton *)sender;
    if( b.tag == 0){
        label.text = @"0";
        startInput = YES;
        operation = -1;
        currentValue = 0;
    }
    else{
        int len = [label.text length];
        if(len ==1){
            label.text = @"0";
            startInput=YES;
            operation=-1;
        }else{
            label.text = [label.text substringToIndex:len-1];
        }
    }
}

@end
