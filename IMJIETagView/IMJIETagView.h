//
//  IMJIETagView.h
//  IMJIETagView
//
//  Created by 。。。 on 2017/4/19.
//  Copyright © 2017年 isofoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMJIETagFrame.h"

@protocol IMJIETagViewDelegate <NSObject>

-(void)IMJIETagView:(NSArray *)tagArray;

@end

@interface IMJIETagView : UIView{
    //储存选中按钮的tag
    NSMutableArray *selectedBtnList;
}

@property (weak, nonatomic) id<IMJIETagViewDelegate>delegate;

/** 是否能选中 需要在 IMJIETagFrame 前调用  default is YES*/
@property (assign, nonatomic) BOOL clickbool;

/** 未选中边框大小 需要在 IMJIETagFrame 前调用 default is 0.5*/
@property (assign, nonatomic) CGFloat borderSize;

/** IMJIETagFrame */
@property (nonatomic, strong) IMJIETagFrame *tagsFrame;

/** 选中背景颜色 default is whiteColor */
@property (strong, nonatomic) UIColor *clickBackgroundColor;

/** 选中字体颜色 default is TextColor */
@property (strong, nonatomic) UIColor *clickTitleColor;

/** 多选选中 default is 未选中*/
@property (strong, nonatomic) NSArray *clickArray;

/** 单选选中 default is 未选中*/
@property (strong, nonatomic) NSString *clickString;

/** 选中边框大小 default is 0.5*/
@property (assign, nonatomic) CGFloat clickborderSize;

/** 选中边框切割大小 default is 5*/
@property (assign, nonatomic) CGFloat cornerRadius;

/** 1-多选 0-单选 default is 0-单选*/
@property (assign, nonatomic) NSInteger clickStart;

/** 最多选择几个*/
@property (assign, nonatomic) NSInteger ChooseCount;

@end
