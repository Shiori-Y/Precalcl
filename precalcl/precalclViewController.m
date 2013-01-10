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
        //新しく表示する文字列を作成
        label.text = [NSString stringWithFormat:@"%d", b.tag];
        startInput = NO;
    }
    else{
        //すでに表示されている文字列に連結
        label.text = [NSString stringWithFormat:@"%@%d", label.text, b.tag];
    }
}
    
- (IBAction)equal:(id)sender {
    //直前に押された演算子で場合分け
    if (operation == 0){
        currentValue += [label.text intValue];
    } else if( operation == 1 ){
        currentValue -= [label.text intValue];
    } else if( operation == 2 ){
        currentValue *= [label.text intValue];
    } else if( operation == 3 ){
        currentValue /= [label.text intValue];
    }
    //表示の更新
    label.text = [NSString stringWithFormat:@"%d", currentValue];
        startInput = YES;
}
    
- (IBAction)op:(id)sender {
    UIButton *b = (UIButton *)sender;
    //現在値の保存
    currentValue = [label.text intValue];
    //演算の保存
    operation = b.tag;
    startInput = YES;
}

- (IBAction)allclear:(id)sender {
    label.text = @"0";
    startInput = YES;
}



//- (IBAction)signchange:(id)sender {
//}
//- (IBAction)point:(id)sender {
//}

@end
