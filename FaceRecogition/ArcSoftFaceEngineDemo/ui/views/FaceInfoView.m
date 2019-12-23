//
//  FaceInfoView.m
//  ArcSoftFaceEngineDemo
//
//  Created by zhanjun liu on 2019/12/23.
//  Copyright © 2019 ArcSoft. All rights reserved.
//

#import "FaceInfoView.h"
#import "Masonry.h"

@interface FaceInfoView()

@property (nonatomic, strong) UIImageView *bgImgView;
@property (nonatomic, strong) UIImageView *hdBgImageView;

@end

@implementation FaceInfoView

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        UIImageView *temp = [[UIImageView alloc] init];
        temp.image = [UIImage imageNamed:@"背景"];
        _bgImgView = temp;
    }
    return _bgImgView;
}

- (UIImageView *)hdBgImageView {
    if (!_hdBgImageView) {
        UIImageView *temp = [[UIImageView alloc] init];
        temp.image = [UIImage imageNamed:@"顶部"];
        _hdBgImageView = temp;
    }
    return _hdBgImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImgView];
        [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kScreenHeight);
            make.height.mas_equalTo(kScreenWidth);
            make.center.equalTo(self);
        }];
        
        [self addSubview: self.hdBgImageView];
        [self.hdBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kScreenHeight);
            make.height.mas_equalTo(56 * rw);
            make.top.left.right.equalTo(self.bgImgView);
        }];
        
        
        
    }
    return self;
}

@end
