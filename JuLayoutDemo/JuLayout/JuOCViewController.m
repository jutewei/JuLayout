//
//  JuOCViewController.m
//  JusLayout
//
//  Created by Juvid on 2016/12/17.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

#import "JuOCViewController.h"
//#import "UIView+JuLayout.h"
@import JuLayout;
@interface JuOCViewController ()

@end

@implementation JuOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab1 = [UILabel new];
    lab1.backgroundColor = [UIColor redColor];
    lab1.text = @"第一个约束居中";
    [self.view addSubview:lab1];
  
    lab1.juCenterY.equal(0);
    
    lab1.juCenterX.equal(0);
    //horizontalCompressionResistancePriority
    UILabel * lab2 = [UILabel new];
    lab2.text = @"第二个约束";
    lab2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab2];
    lab2.juLead.toView(lab1).equal(0);
    lab2.juTopSpace.toView(lab1).equal(10);
    
    UILabel * lab3 =  [UILabel new];
    lab3.text = @"第三个约束第三个约束";
    lab3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lab3];
    lab3.juLeaSpace.toView(lab1).equal(10);
    lab3.juTrail.greaterEqual(10);
    lab3.juCenterY.toView(lab1).equal(0);

    UIView *vie=[[UIView alloc]init];
    vie.backgroundColor=[UIColor redColor];
    [self.view addSubview:vie];
    vie.juCenterX.equal(0);
    vie.juSize(CGSizeMake(0, 100));
    vie.juBottom.safe.equal(0);
  
//    juTest = "12345"
//    NSLog("%@", self.juTest)

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
