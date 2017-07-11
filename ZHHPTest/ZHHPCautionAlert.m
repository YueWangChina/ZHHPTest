//
//  ZHHPCautionAlert.m
//  ZHHPTest
//
//  Created by wang on 17/7/11.
//  Copyright © 2017年 BJZhongHeHuangPU. All rights reserved.
//

#import "ZHHPCautionAlert.h"

#define ZHFONTSIZE 15
@implementation ZHHPCautionAlert

+(void)zh_showMessage:(NSString *)message WithImage:(UIImage*)image{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    if (message==nil||[message isEqualToString:@""]) {
        message=nil;
    }
    
    ShowView *showView=[[ShowView alloc]initWithTitle:message WithImage:image];
    [showView sizeToFit];
    [window addSubview:showView];
    CGSize size=  [[self class] sizeWihtString:message];
    NSLayoutConstraint *constraint1=[NSLayoutConstraint constraintWithItem:showView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:window
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1
                                                                  constant:0];
    NSLayoutConstraint *constraint2=[NSLayoutConstraint constraintWithItem:showView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:window
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:50];
    
    NSLayoutConstraint *constraint3=[NSLayoutConstraint constraintWithItem:showView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1
                                                                  constant:image.size.width>size.width?image.size.width+20:size.width+20];
    NSLayoutConstraint *constraint4=[NSLayoutConstraint constraintWithItem:showView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1
                                                                  constant: image.size.height+size.height+20];
    [window addConstraints:@[constraint1,constraint2,constraint3,constraint4]];
    [UIView animateWithDuration:3 animations:^{
        showView.alpha = 0;
    } completion:^(BOOL finished) {
        [showView removeFromSuperview];
    }];
    
    
}

+(CGSize)sizeWihtString:(NSString*)string{
    CGSize textSize = [string boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:ZHFONTSIZE]}
                                           context:nil].size;
    
    return textSize;
    
}


@end
@interface ShowView ()

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)UIImage *image;

@end
@implementation ShowView

-(id)initWithTitle:(NSString*)title WithImage:(UIImage*)image{
    
    if (self=[super init]) {
        self.backColor=[UIColor blackColor];
        self.title=title;
        self.image=image;
        self.alpha = 1.0f;
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.translatesAutoresizingMaskIntoConstraints=false;
        
        if (title !=nil && image ==nil) {
            self.alertStyle=CautionAlertStyleWithTitle;
        }else if ( title ==nil && image !=nil){
            self.alertStyle=CautionAlertStyleWithImage;
        }else if (title !=nil && image !=nil){
            self.alertStyle=CautionAlertStyleWithTitleAndImage;
        }
        
        
        [self setUp_UI];
        
    }
    
    return self;
}

-(void)setUp_UI{
    
    switch (self.alertStyle) {
        case CautionAlertStyleWithTitle:
        {
            [self addSubview:self.titleLabel];
            [self layoutConstraintWith:self.titleLabel];
        }
            break;
        case CautionAlertStyleWithImage:
        {
            [self addSubview:self.imageView];
            [self layoutConstraintWith:self.imageView];
        }
            break;
        case CautionAlertStyleWithTitleAndImage:
        {
            [self addSubview:self.titleLabel];
            [self addSubview:self.imageView];
            [self layoutConstraints];
        }
            break;
    }
    
}

/**
 此方法调用是存在单一UI控件，才调用此方法
 
 @param TitleOrImage 控件
 */
-(void)layoutConstraintWith:(id)TitleOrImage{
    for (UIView *view in self.subviews) {
        view.translatesAutoresizingMaskIntoConstraints=false;
    }
    NSLayoutConstraint *constraint1=[NSLayoutConstraint constraintWithItem:TitleOrImage
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1
                                                                  constant:0];
    NSLayoutConstraint *constraint2=[NSLayoutConstraint constraintWithItem:TitleOrImage
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:0];
    [self addConstraints:@[constraint1,constraint2]];
}

/**
 标题和图片同事存在的情况下，调用此方法
 */
-(void)layoutConstraints{
    for (UIView *view in self.subviews) {
        view.translatesAutoresizingMaskIntoConstraints=false;
    }
    NSLayoutConstraint *constraint1=[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:10];
    NSLayoutConstraint *constraint2=[NSLayoutConstraint
                                     constraintWithItem:self.imageView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                     multiplier:1
                                     constant:0];
    NSLayoutConstraint *constraint3=[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.imageView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:10];
    NSLayoutConstraint *constraint4=[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1
                                                                  constant:0];
    [self addConstraints:@[constraint1,constraint2,constraint3,constraint4]];
    
}
-(void)setImage:(UIImage *)image{
    _image=image;
    self.imageView.image=_image;
}
-(void)setTitle:(NSString *)title{
    _title=title;
    self.titleLabel.text=_title;
}
-(void)setBackColor:(UIColor *)backColor{
    _backColor=backColor;
    self.backgroundColor=_backColor;
}

-(UILabel*)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel=[UILabel zh_labelWithText:@"" fontSize:ZHFONTSIZE color:[UIColor whiteColor]];
    }
    return _titleLabel;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        [_imageView sizeToFit];
    }
    
    return _imageView;
}
@end

@implementation UILabel (ZHAddition)

+ (instancetype)zh_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor = color;
    label.numberOfLines = 0;
    
    [label sizeToFit];
    
    return label;
}

@end
