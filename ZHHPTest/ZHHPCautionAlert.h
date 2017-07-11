//
//  ZHHPCautionAlert.h
//  ZHHPTest
//
//  Created by wang on 17/7/11.
//  Copyright © 2017年 BJZhongHeHuangPU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CautionAlertStyle) {
    CautionAlertStyleWithTitle=0,
    CautionAlertStyleWithImage,
    CautionAlertStyleWithTitleAndImage,
};
@class ShowView;

@interface ZHHPCautionAlert : NSObject


+(void)zh_showMessage:(NSString *)message WithImage:(UIImage*)image;



@end

@interface ShowView : UIView

//背景颜色默认黑色
@property(nonatomic,strong) UIColor *backColor;
//标题
@property(nonatomic,strong) UILabel *titleLabel;
//图片
@property(nonatomic,strong) UIImageView *imageView;
//类型
@property(nonatomic ,assign)CautionAlertStyle alertStyle;

-(id)initWithTitle:(NSString*)title WithImage:(UIImage*)image;

-(void)setUp_UI;

@end

@interface UILabel (ZHAddition)

/// 创建文本标签
///
/// @param text     文本
/// @param fontSize 字体大小
/// @param color    颜色
///
/// @return UILabel
+ (instancetype)zh_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;

@end
