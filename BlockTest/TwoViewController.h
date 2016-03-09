//
//  TwoViewController.h
//  BlockTest
//
//  Created by 彭章晏 on 15/11/6.
//  Copyright © 2015年 pengzm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GetValueBlock)(NSString *showTextField);

@interface TwoViewController : UIViewController


//第二种实现方式   用于cell传值
- (void)handlerButtonAction:(GetValueBlock)block;
@property (nonatomic,copy)GetValueBlock getValueBlock;

@end
