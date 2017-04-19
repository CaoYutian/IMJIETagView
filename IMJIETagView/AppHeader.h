//
//  AppHeader.h
//  IMJIETagView
//
//  Created by 。。。 on 2017/4/19.
//  Copyright © 2017年 isofoo. All rights reserved.
//

#ifndef AppHeader_h
#define AppHeader_h

#define RGBA(r,g,b,a)        [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a] //RGBP生产UIColor对象
#define CYTMainScreen        [UIScreen mainScreen].bounds   //屏幕尺寸
#define CYTMainScreen_HEIGHT CYTMainScreen.size.height      //屏幕高度
#define CYTMainScreen_WIDTH  CYTMainScreen.size.width       //屏幕宽度
#define SizeScale ((640.0f > CYTMainScreen_HEIGHT) ? CYTMainScreen_HEIGHT/640.0f : 1)
#define FitFont(value) [UIFont systemFontOfSize:value * SizeScale] //适配的文字大小
#define FitwidthRealValue(value) ((value) / 360.0f * CYTMainScreen_WIDTH)
#define FitheightRealValue(value) ((value) / 640.0f * CYTMainScreen_HEIGHT)

#endif /* AppHeader_h */
