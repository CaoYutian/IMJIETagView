//
//  ViewController.m
//  IMJIETagView
//
//  Created by 。。。 on 2017/4/19.
//  Copyright © 2017年 isofoo. All rights reserved.
//

#import "ViewController.h"
#import "IMJIETagFrame.h"
#import "IMJIETagView.h"
#import "AppHeader.h"

@interface ViewController ()<IMJIETagViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CreateUI];
}

- (void)CreateUI {
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = FitwidthRealValue(15);
    frame.tagsMargin = FitheightRealValue(10);
    frame.tagsLineSpacing = FitwidthRealValue(10);
    frame.tagsArray = @[@"包装破损",@"大小不均匀",@"包装破损",@"大小不均匀",@"包装破损",@"大小不均匀",@"包装破损",@"大小不均匀",@"包装破损"];
    
    IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 20, CYTMainScreen_WIDTH, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 1;
    tagView.clickborderSize = 1;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = RGBA(242, 242, 242, 1.0);
    tagView.clickTitleColor = RGBA(18,171,57,1.0);
    tagView.clickStart = 1;//单选  tagView.clickStart 为0 多选 tagView.clickStart为1
    tagView.clickString = @"";
    tagView.delegate = self;
    [self.view addSubview:tagView];
}

#pragma mark 选中
-(void)IMJIETagView:(NSArray *)tagArray{
    NSLog(@"选中的------>>%@",tagArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
