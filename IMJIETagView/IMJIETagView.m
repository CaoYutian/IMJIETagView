//
//  IMJIETagView.m
//  IMJIETagView
//
//  Created by 。。。 on 2017/4/19.
//  Copyright © 2017年 isofoo. All rights reserved.
//

#import "IMJIETagView.h"
#import "AppHeader.h"
#define TextColor RGBA(102, 102, 102, 1.0)

@implementation IMJIETagView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        selectedBtnList = [[NSMutableArray alloc] init];
        self.clickTitleColor = TextColor;
        self.clickArray = nil;
        self.clickbool = YES;
        self.borderSize = 0.5;
        self.clickborderSize =0.5;
        self.cornerRadius = 5;
        self.ChooseCount = 3;
    }
    return self;
}

-(void)setTagsFrame:(IMJIETagFrame *)tagsFrame{
    
    _tagsFrame = tagsFrame;
    for (NSInteger i=0; i<tagsFrame.tagsArray.count; i++) {
        UIButton *tagsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagsBtn setTitle:tagsFrame.tagsArray[i] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:TextColor forState:UIControlStateNormal];
        tagsBtn.titleLabel.font = TagTitleFont;
        tagsBtn.tag = i;
        tagsBtn.backgroundColor = self.clickBackgroundColor;
        [self makeCorner:self.borderSize view:tagsBtn color:RGBA(221, 221, 221, 1) cornerRadius:self.cornerRadius];
        tagsBtn.frame = CGRectFromString(tagsFrame.tagsFrames[i]);
        [tagsBtn addTarget:self action:@selector(TagsBtn:) forControlEvents:UIControlEventTouchDown];
        tagsBtn.enabled = _clickbool;
        [self addSubview:tagsBtn];
    }
    
}

#pragma mark 选中背景颜色
-(void)setClickBackgroundColor:(UIColor *)clickBackgroundColor{
    
    if (_clickBackgroundColor != clickBackgroundColor) {
        _clickBackgroundColor = clickBackgroundColor;
    }
}

#pragma makr 选中字体颜色
-(void)setClickTitleColor:(UIColor *)clickTitleColor{
    
    if (_clickTitleColor != clickTitleColor) {
        _clickTitleColor = clickTitleColor;
    }
}

#pragma makr 能否被选中
-(void)setClickbool:(BOOL)clickbool{
    _clickbool = clickbool;
}

#pragma makr 未选中边框大小
-(void)setBorderSize:(CGFloat)borderSize{
    
    if (_borderSize!=borderSize) {
        _borderSize = borderSize;
    }
}

#pragma makr 选中边框大小
-(void)setClickborderSize:(CGFloat)clickborderSize{
    
    if (_clickborderSize!= clickborderSize) {
        _clickborderSize = clickborderSize;
    }
}

#pragma makr 默认选择 单选
-(void)setClickString:(NSString *)clickString{
    
    if (_clickString != clickString) {
        _clickString = clickString;
    }
    if ([_tagsFrame.tagsArray containsObject:_clickString]) {
        
        NSInteger index = [_tagsFrame.tagsArray indexOfObject:_clickString];
        [self ClickString:index];
    }
}

#pragma mark 默认选择 多选
-(void)setClickArray:(NSArray *)clickArray{
    
    if (_clickArray != clickArray) {
        _clickArray = clickArray;
    }
    
    for (NSString *string in clickArray) {
        
        if ([_tagsFrame.tagsArray containsObject:string]) {
            
            NSInteger index = [_tagsFrame.tagsArray indexOfObject:string];
            NSString *x = [[NSString alloc] initWithFormat:@"%ld",(long)index];
            [self ClickArray:x];
        }
        
    }
    
}

#pragma makr 单选
-(void)ClickString:(NSInteger )index{
    
    UIButton *btn;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            btn = (UIButton *)obj;
            if (btn.tag == index){
                
                btn.backgroundColor = self.clickBackgroundColor;
                [btn setTitleColor:_clickTitleColor forState:UIControlStateNormal];
                [self makeCorner:_clickborderSize view:btn color:_clickTitleColor cornerRadius:self.cornerRadius];
                [_delegate IMJIETagView:@[[NSString stringWithFormat:@"%ld",(long)index]]];
                
            }else{
                btn.backgroundColor = [UIColor whiteColor];
                [btn setTitleColor:TextColor forState:UIControlStateNormal];
                [self makeCorner:_borderSize view:btn color:RGBA(221, 221, 221, 1) cornerRadius:self.cornerRadius];
                
            }
        }
    }
}

#pragma mark 多选
-(void)ClickArray:(NSString *)index{
    
    UIButton *btn;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            btn = (UIButton *)obj;
            if (btn.tag == [index integerValue]){
                
                if ([selectedBtnList containsObject:index]) {
                    
                    btn.backgroundColor = self.clickBackgroundColor;
                    [btn setTitleColor:TextColor forState:UIControlStateNormal];
                    [self makeCorner:_borderSize view:btn color:RGBA(221, 221, 221, 1) cornerRadius:self.cornerRadius];
                    [selectedBtnList removeObject:index];
                    
                }else{
                    
                    btn.backgroundColor = [UIColor whiteColor];
                    [btn setTitleColor:_clickTitleColor forState:UIControlStateNormal];
                    [self makeCorner:_clickborderSize view:btn color:_clickTitleColor cornerRadius:self.cornerRadius];
                    [selectedBtnList addObject:index];
                    
                }
                
                [_delegate IMJIETagView:selectedBtnList];
                
            }
        }
        
    }
    
}

-(void)makeCorner:(CGFloat)corner view:(UIView *)view color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    
    CALayer * fileslayer = [view layer];
    fileslayer.borderColor = [color CGColor];
    fileslayer.borderWidth = corner;
    fileslayer.cornerRadius = cornerRadius;
    
}

-(void)TagsBtn:(UIButton *)sender{
    
    if (self.clickStart == 0) {
        //单选
        [self ClickString:sender.tag];
        
    }else{
        //多选
        NSString *x = [[NSString alloc] initWithFormat:@"%ld",(long)sender.tag];
        [self ClickArray:x];
    }
}

@end
