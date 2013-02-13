//
//  precalclViewController.m
//  precalcl
//
//  Created by 湯尾　志織 on 12/10/23.
//  Copyright (c) 2012年 Shiori Yuo. All rights reserved.
//

#import "precalclViewController.h"

@interface precalclViewController (){
    precalclStateMachine *staemachine;
}
@end

@implementation precalclViewController
@synthesize model;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    model = [[precalclStateMachine alloc]init];
    model.a = 0;
    model.b = 0;
    model.c = 0;
    model.d = 0;
    model.e = 1;
    model.kei = 0;
    model.p = 0;

//    startInput   = YES;
//    currentValue = 0;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


-(void)Button:(int)number{
    switch (model.kei){
        case 0:
            //押されたボタンが小数点でなければ、前の桁を１０倍して位上げし、１の桁として押された数を足す
            if (model.p == 0){
                model.a = model.a * 10 + number;
                [self windowSetText:2];
            }
            else{
                //押されたボタンが小数点ならば
                model.c = number * pow(10,(-model.e));
                //model.cに小数点以下に計算した数を入れ、元の値に足し合わせる
                model.d = model.a + model.c;
                [self windowSetText:4];
                model.a = model.d;
                model.e = model.e + 1;
            }
            break;
            
        case 1:
            
            if (model.p == 0){
                model.b = model.b * 10 + number;
                [self windowSetText:3];
            }
            else{
                model.c = number * pow(10,(-model.e));
                model.d = model.b + model.c;
                [self windowSetText:4];
                model.b = model.d;
                model.e = model.e + 1;
            }
            break;
    }
}

//- (IBAction)number:(id)sender {
//
//    UIButton *b = (UIButton *)sender;
    
//    if( startInput ){
        //最初の一桁目が０なら表示しない
//        if( b.tag == 0 ) return;
//       if( b.tag == 10 ){
//            label.text = [NSString stringWithFormat:@"0."];
//        }
//        else{
            //新しく表示する文字列を作成
//            label.text = [NSString stringWithFormat:@"%d", b.tag];
//       }
//        startInput = NO;
//    }
//    else{
        //すでに表示されている文字列に連結
//        if( b.tag == 10 ){
            //"."ならばすでに"."がないかチェック
//            NSRange searchResult = [label.text rangeOfString:@"."];
//           if(searchResult.location == NSNotFound){
//                label.text = [NSString stringWithFormat:@"%@%@",label.text,@"."];
//            }
//        }
//       else{
//        label.text = [NSString stringWithFormat:@"%@%d", label.text, b.tag];
//        }
//    }
//}
    
- (IBAction)equal:(id)sender {
    [model calc];
    [self windowSetText:2];
    
    
    //直前に押された演算子で場合分け
//    if (operation == -1)return;
//    if (operation == 0){
//        currentValue += [label.text doubleValue];
//    } else if( operation == 1 ){
//        currentValue -= [label.text doubleValue];
//    } else if( operation == 2 ){
//        currentValue *= [label.text doubleValue];
//    } else if( operation == 3 ){
//        currentValue /= [label.text doubleValue];
//    }
    //表示の更新
//    label.text = [NSString stringWithFormat:@"%g", currentValue];
//        startInput = YES;
//        operation = -1;
}

- (void)windowSetText:(int)selecter{
    switch (selecter){
        case 1:
            [[self window] setText:[NSString stringWithFormat:@"%d",0]];
            break;
        case 2:
            [[self window] setText:[NSString stringWithFormat:@"%g",model.a]];
            break;
        case 3:
            [[self window] setText:[NSString stringWithFormat:@"%g",model.b]];
            break;
        case 4:
            [[self window] setText:[NSString stringWithFormat:@"%g",model.d]];
            break;
    }
}

//- (IBAction)op:(id)sender {
//    UIButton *b = (UIButton *)sender;
    //現在値の保存
//    currentValue = [label.text doubleValue];
    //演算の保存
//    operation = b.tag;
//    startInput = YES;
//}

- (IBAction)clear:(id)sender {
    //クリアボタンを押した場合、初期値に戻す
    model.a = 0;
    model.b = 0;
    model.c = 0;
    model.d = 0;
    model.e = 1;
    model.ans = 0;
    model.kei = 0;
    model.p = 0;
    [self windowSetText:1];
//     UIButton *b = (UIButton *)sender;
//    if( b.tag == 0){
//        label.text = @"0";
//        startInput = YES;
//        operation = -1;
//        currentValue = 0;
//    }
//    else{
//        int len = [label.text length];
//        if(len ==1){
//            label.text = @"0";
//            startInput=YES;
//            operation=-1;
//        }else{
//            label.text = [label.text substringToIndex:len-1];
//        }
//    }
}

//数値、演算子によって異なる動作を分ける
- (IBAction)plus:(id)sender {
    if(model.kei == 0){
    [self windowSetText:1];
    }
    else{
        [model calc];
        [self windowSetText:2];
    }
    [model math:1];
}

- (IBAction)minus:(id)sender {
    if(model.kei == 0){
        [self windowSetText:1];
    }
    else{
        [model calc];
        [self windowSetText:2];
    }
    [model math:2];
}
- (IBAction)multiply:(id)sender {
    if(model.kei == 0){
        [self windowSetText:1];
    }
    else{
        [model calc];
        [self windowSetText:2];
    }
    [model math:3];
}

- (IBAction)divide:(id)sender {
    if(model.kei == 0){
        [self windowSetText:1];
    }
    else{
        [model calc];
        [self windowSetText:2];
    }
    [model math:4];
}
    
    
- (IBAction)point:(id)sender {
    model.p = 1;
}
- (IBAction)zero:(id)sender {
    [self Button:0];
}
- (IBAction)one:(id)sender {
    [self Button:1];
}
- (IBAction)two:(id)sender {
    [self Button:2];
}
- (IBAction)three:(id)sender {
    [self Button:3];
}
- (IBAction)four:(id)sender {
    [self Button:4];
}
- (IBAction)five:(id)sender {
    [self Button:5];
}
- (IBAction)six:(id)sender {
    [self Button:6];
}
- (IBAction)seven:(id)sender {
    [self Button:7];
}
- (IBAction)eight:(id)sender {
    [self Button:8];
}
- (IBAction)nine:(id)sender {
    [self Button:9];
}


@end
