//
//  ADChatSendCell.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ADChatSendCell.h"

#import "Masonry.h"
#import "ADChatModel.h"

@interface ADChatSendCell ()
{
    UIImageView *_headImageView;
    UIImageView *_bubbleImageView;
    UILabel *_contentLabel;
}
@end

@implementation ADChatSendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _headImageView = [[UIImageView alloc] init];
        _headImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_headImageView];
        
        
        _bubbleImageView = [[UIImageView alloc] init];
        _bubbleImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_bubbleImageView];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor yellowColor];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        //  约束
        __weak ADChatSendCell *weakSelf = self;
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).offset(-10);
            make.top.equalTo(weakSelf.contentView).offset(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView).offset(20);
            make.right.equalTo(_headImageView.mas_left).offset(-20);
            make.width.lessThanOrEqualTo(weakSelf.contentView).offset(-150);
            make.height.lessThanOrEqualTo(weakSelf.contentView).offset(-40);
        }];
        
        
        [_bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView.mas_left).offset(-10);
            make.left.equalTo(_contentLabel).offset(-10);
            make.top.equalTo(_headImageView);
            make.height.equalTo(_contentLabel).offset(20);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateModel:(ADChatModel *)model {
    _contentLabel.text = model.content;
}

@end
