//
//  ViewController.m
//  BlockTest
//
//  Created by 彭章晏 on 15/11/6.
//  Copyright © 2015年 pengzm. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *LabelImageBtn;

@end
/*
 _jsContext[@"htmlCallApp"] = ^(NSString *paramStr) {
    第三种block，直接这样写，方法执行到这里不会执行{}内的代码，在你触发回调的时候才会执行
 }
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.LabelImageBtn setTitle:@"这是文本" forState:UIControlStateNormal];
    [self.LabelImageBtn setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
     self.LabelImageBtn.imageEdgeInsets = UIEdgeInsetsMake(5,-10,5,self.LabelImageBtn.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    self.LabelImageBtn.titleEdgeInsets = UIEdgeInsetsMake(5, 50, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
    //   button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
}
- (IBAction)pushButton:(id)sender {

    TwoViewController *twoVc = [[TwoViewController alloc]initWithNibName:@"TwoViewController" bundle:nil];

    __weak typeof(self) weakSelf = self;
    twoVc.getValueBlock = ^(NSString *showTextField){
//        typeof(self) strongSelf = weakSelf;
        if (weakSelf) {
            weakSelf.label.text = showTextField;
        }
    };
    
    //方式2
//    [twoVc handlerButtonAction:^(NSString *showTextField) {
//        weakSelf.label.text = showTextField;
//    }];
    

    [self.navigationController pushViewController:twoVc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
