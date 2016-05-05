//
//  ADChatTimeCell.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/5.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ADChatTimeCell.h"

#import "ADChatModel.h"
#import "Masonry.h"

@interface ADChatTimeCell ()
{
    UILabel *_timeLabel;
}
@end

@implementation ADChatTimeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
        
        __weak ADChatTimeCell *weakSelf = self;
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.contentView);
            make.top.equalTo(weakSelf.contentView).offset(10);
            make.bottom.equalTo(weakSelf.contentView).offset(-10);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateModel:(ADChatModel *)model {
    _timeLabel.text = model.content;
}

@end
