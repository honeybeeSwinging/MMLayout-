

#import "UIView+MMLayout.h"

@implementation UIView (MM)
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setW:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}
- (CGFloat)w{
    return self.frame.size.width;
}
- (void)setH:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}
- (CGFloat)h{
    return self.frame.size.height;
}
- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)minY{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)minX{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)halfW{
    return self.w / 2;
}
- (CGFloat)halfH{
    return self.h / 2;
}
- (CGFloat)halfX{
    return self.x / 2;
}
- (CGFloat)halfY{
    return self.y / 2;
}
@end
@interface MMLayout()
@property (weak   , nonatomic) UIView *layoutView;
@end

@implementation MMLayout
-(instancetype)initWithLayoutView:(UIView *)LayoutView{
    if (self=[super init]) {
        self.layoutView = LayoutView;
    }
    return self;
}
-(void)setLeft:(CGFloat)left{
    _left = left;
    self.layoutView.x = left;
}
-(void)setTop:(CGFloat)top{
    _top = top;
    self.layoutView.y = top;
}
-(void)setRight:(CGFloat)right{
    _right = right;
   UIView *superview = self.layoutView.superview;
    self.layoutView.x = superview.w - self.layoutView.w - right;
}

-(void)setBottom:(CGFloat)bottom{
    _bottom = bottom;
    UIView *superview = self.layoutView.superview;
    self.layoutView.y =  superview.h - self.layoutView.h - bottom;
}

-(void)setHeight:(CGFloat)height{
    _height = height;
    self.layoutView.h  = height;
    
}
-(void)setWidth:(CGFloat)width{
    _width = width;
    self.layoutView.w = width;
}
-(void)setSize:(CGSize )size{
    self.layoutView.w = size.width;
    self.layoutView.h = size.height;
}
-(void)center{
    UIView *superview = self.layoutView.superview;
    self.layoutView.x = superview.halfW - self.layoutView.halfW;
    self.layoutView.y = superview.halfH - self.layoutView.halfH;
}
@end

@implementation UIView (Layout)
-(void)make_Layout:(void (^)(MMLayout *))layout{
    if (layout) {
        MMLayout *mm_Layout = [[MMLayout alloc] initWithLayoutView:self];
        layout(mm_Layout);
    }
}

@end



