#import "MTEditableMathLabel.h"

@implementation MTEditableMathLabel

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        // Default to display mode and black text like MTMathUILabel
        self.labelMode = kMTMathUILabelModeDisplay;
    }
    return self;
}

- (CGSize)mathDisplaySize
{
    return [self intrinsicContentSize];
}

- (void)clear
{
    self.latex = @"";
}

- (void)setLatex:(NSString *)latex
{
    [super setLatex:latex];
    if ([self.delegate respondsToSelector:@selector(textModified:)]) {
        [self.delegate textModified:self];
    }
}

@end


