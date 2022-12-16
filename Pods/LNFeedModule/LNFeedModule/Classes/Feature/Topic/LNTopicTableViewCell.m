//
//  LNTopicTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicTableViewCell.h"
#import "LNUIKitHelper.h"

@implementation LNTopicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

//子类型重写，更新cell的数据
- (void)reloadWithData:(LNTopic *)topic
{
    self.nameLabel.text = topic.name;
}

//子类型重写，更新cell的布局
- (void)updateSubviewsLayout
{
    _nameLabel.frame = CGRectMake(15, 0, [UIScreen width]-30, 40);
}

//子类型重写，更新cell的样式
- (void)updateSubviewsStyle
{
    
}


- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize18];
        _nameLabel.textColor = [UIColor grayColor];
        _nameLabel.frame = CGRectMake(15, 0, [UIScreen width]-30, 40);
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
