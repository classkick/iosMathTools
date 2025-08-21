#import "../render/MTMathUILabel.h"

@class MTEditableMathLabel;

@protocol MTEditableMathLabelDelegate <NSObject>
@optional
- (void)returnPressed:(MTEditableMathLabel*)label;
- (void)textModified:(MTEditableMathLabel*)label;
@end

@interface MTEditableMathLabel : MTMathUILabel

@property (nonatomic, weak, nullable) id<MTEditableMathLabelDelegate> delegate;

- (CGSize)mathDisplaySize;
- (void)clear;

@end



