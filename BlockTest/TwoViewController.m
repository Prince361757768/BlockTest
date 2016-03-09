//
//  TwoViewController.m
//  BlockTest
//
//  Created by 彭章晏 on 15/11/6.
//  Copyright © 2015年 pengzm. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)backButton:(id)sender {

    if (self.getValueBlock) {

        self.getValueBlock(self.textField.text);
    }

    [self.navigationController popViewControllerAnimated:YES];
    //方式2
//     self.getValueBlock(self.textField.text);
}
//block的实现部分
- (void)handlerButtonAction:(GetValueBlock)block
{
    self.getValueBlock= block;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
