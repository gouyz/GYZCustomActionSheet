//
//  GYZSheetCell.m
//  GYZCustomActionSheet
//
//  Created by GYZ on 16/6/20.
//  Copyright © 2016年 GYZ. All rights reserved.
//

#import "GYZSheetCell.h"
#import "GYZCommon.h"

@implementation GYZSheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth-10*2, 44.5)];
        _myLabel.backgroundColor = [UIColor whiteColor];
        _myLabel.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0];
        _myLabel.font = [UIFont systemFontOfSize:18];
        if (kScreenHeight == 667) {
            _myLabel.font = [UIFont systemFontOfSize:20];
        }
        else if (kScreenHeight > 667) {
            _myLabel.font = [UIFont systemFontOfSize:21];
        }
        [self.contentView addSubview:self.myLabel];
        
        self.tableDivLine = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(self.myLabel), kScreenWidth, kLineHeight)];
        self.tableDivLine.backgroundColor = kGrayLineColor;
        [self.contentView addSubview: self.tableDivLine];
    }
    return self;
}

@end
