//
//  YXTableViewCellAnimation.m
//  YXTableViewCellAnimationTest
//
//  Created by ios on 2020/10/21.
//

#import "YXTableViewCellAnimation.h"

@implementation YXTableViewCellAnimation

#pragma mark - 初始时，显示动画
+ (void)initShowAnimationWithTableViewByType:(UITableView *)tableView animationType:(YXTableViewCellAnimationType)animationType duration:(CGFloat)duration delay:(CGFloat)delay usingSpringWithDamping:(CGFloat)usingSpringWithDamping initialSpringVelocity:(CGFloat)initialSpringVelocity {
    
    NSArray *cells = tableView.visibleCells;
    switch (animationType) {
        case YXTableViewCellAnimationTypeMove: {
            for (int i = 0; i < cells.count; i++) {
                CGFloat durationTime = duration == 0 ? 0.25 : duration;
                CGFloat delayTime = delay == 0 ? 0.3 : delay;
                
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                [UIView animateWithDuration:durationTime delay:i *(delayTime /cells.count) options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeSpring: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.7 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.7 : initialSpringVelocity;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                [UIView animateWithDuration:durationTime delay:i *(durationTime /cells.count) usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeAlpha: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.05 : delay;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.alpha = 0.0;
                [UIView animateWithDuration:durationTime delay:i *delayTime options:0 animations:^{
                    
                    cell.alpha = 1.0;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeFall: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.8 : delay;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(0, -kTableViewCellAnimationBasicWidth);
                [UIView animateWithDuration:durationTime delay:(cells.count - i) *(delayTime /cells.count) options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeShake: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat delayTime = delay == 0 ? 0.03 : delay;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.75 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.75 : initialSpringVelocity;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                if (i %2 == 0) {
                    cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                }
                else {
                    cell.transform = CGAffineTransformMakeTranslation(kTableViewCellAnimationBasicWidth, 0);
                }
                [UIView animateWithDuration:durationTime delay:i *delayTime usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeOverTurn: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.7 : delay;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                cell.layer.opacity = 0.0;
                cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
                [UIView animateWithDuration:durationTime delay:i *(delayTime /cells.count) options:0 animations:^{
                    
                    cell.layer.opacity = 1.0;
                    cell.layer.transform = CATransform3DIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeToTop: {
            CGFloat durationTime = duration == 0 ? 0.35 : duration;
            CGFloat delayTime = delay == 0 ? 0.8 : delay;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(0, kTableViewCellAnimationBasicHight);
                [UIView animateWithDuration:durationTime delay:i *(delayTime /cells.count) options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeSpringList: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat delayTime = delay == 0 ? 1 : delay;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.65 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.65 : initialSpringVelocity;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                cell.layer.opacity = 0.7;
                cell.layer.transform = CATransform3DMakeTranslation(0, -kTableViewCellAnimationBasicHight, 20);
                [UIView animateWithDuration:durationTime delay:i *(delayTime /cells.count) usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    cell.layer.opacity = 1.0;
                    cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeShrinkToTop: {
            CGFloat durationTime = duration == 0 ? 0.5 : duration;
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
                cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
                [UIView animateWithDuration:durationTime animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeLayDown: {
            CGFloat durationTime = duration == 0 ? 0.8 : duration;
            
            NSMutableArray *rectArr = [[NSMutableArray alloc] init];
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = cell.frame;
                [rectArr addObject:[NSValue valueWithCGRect:rect]];
                rect.origin.y = i *10;
                cell.frame = rect;
                cell.layer.transform = CATransform3DMakeTranslation(0, 0, i *5);
            }
            
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
                [UIView animateWithDuration:(durationTime /cells.count) *i animations:^{
                    
                    cell.frame = rect;
                } completion:^(BOOL finished) {
                    
                    cell.layer.transform = CATransform3DIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeRote: {
            CGFloat durationTime = duration == 0 ? 0.1 : duration;
            CGFloat delayTime = delay == 0 ? 0.25 : delay;
            
            NSArray *cells = tableView.visibleCells;
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            animation.fromValue = @(-M_PI);
            animation.toValue = 0;
            animation.duration = 0.3;
            animation.removedOnCompletion = NO;
            animation.repeatCount = 3;
            animation.fillMode = kCAFillModeForwards;
            animation.autoreverses = NO;

            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                cell.alpha = 0.0;
                [UIView animateWithDuration:durationTime delay:i *delayTime options:0 animations:^{
                    
                    cell.alpha = 1.0;
                } completion:^(BOOL finished) {
                    
                    [cell.layer addAnimation:animation forKey:@"rotationYkey"];
                }];
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - 滚动时，显示动画
+ (void)scrollShowAnimationWithTableViewCellByType:(UITableView *)tableView cell:(UITableViewCell *)cell animationType:(YXTableViewCellAnimationType)animationType index:(NSInteger)index amount:(NSInteger)amount duration:(CGFloat)duration delay:(CGFloat)delay usingSpringWithDamping:(CGFloat)usingSpringWithDamping initialSpringVelocity:(CGFloat)initialSpringVelocity {
    
    switch (animationType) {
        case YXTableViewCellAnimationTypeMove: {
            CGFloat durationTime = duration == 0 ? 0.25 : duration;
            CGFloat delayTime = delay == 0 ? 0.3 : delay;
            
            cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            [UIView animateWithDuration:durationTime delay:index *(delayTime /amount) options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeSpring: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.7 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.7 : initialSpringVelocity;
            
            cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            [UIView animateWithDuration:durationTime delay:index *(durationTime /amount) usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeAlpha: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.05 : delay;
            
            cell.alpha = 0.0;
            [UIView animateWithDuration:durationTime delay:index *delayTime options:0 animations:^{
                
                cell.alpha = 1.0;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeFall: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.8 : delay;
            
            cell.transform = CGAffineTransformMakeTranslation(0, -kTableViewCellAnimationBasicWidth);
            [UIView animateWithDuration:durationTime delay:(amount - index) *(delayTime /amount) options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeShake: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat delayTime = delay == 0 ? 0.03 : delay;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.75 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.75 : initialSpringVelocity;
            
            if (index %2 == 0) {
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            }
            else {
                cell.transform = CGAffineTransformMakeTranslation(kTableViewCellAnimationBasicWidth, 0);
            }
            [UIView animateWithDuration:durationTime delay:index *delayTime usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeOverTurn: {
            CGFloat durationTime = duration == 0 ? 0.3 : duration;
            CGFloat delayTime = delay == 0 ? 0.7 : delay;
            
            cell.layer.opacity = 0.0;
            cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
            [UIView animateWithDuration:durationTime delay:index *(delayTime /amount) options:0 animations:^{
                
                cell.layer.opacity = 1.0;
                cell.layer.transform = CATransform3DIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeToTop: {
            CGFloat durationTime = duration == 0 ? 0.35 : duration;
            CGFloat delayTime = delay == 0 ? 0.8 : delay;
            
            cell.transform = CGAffineTransformMakeTranslation(0, kTableViewCellAnimationBasicHight);
            [UIView animateWithDuration:durationTime delay:index *(delayTime /amount) options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeSpringList: {
            CGFloat durationTime = duration == 0 ? 0.4 : duration;
            CGFloat delayTime = delay == 0 ? 1 : delay;
            CGFloat usingSpringWithDampingTime = usingSpringWithDamping == 0 ? 0.65 : usingSpringWithDamping;
            CGFloat initialSpringVelocityTime = initialSpringVelocity == 0 ? 1 /0.65 : initialSpringVelocity;
            
            cell.layer.opacity = 0.7;
            cell.layer.transform = CATransform3DMakeTranslation(0, -kTableViewCellAnimationBasicHight, 20);
            [UIView animateWithDuration:durationTime delay:index *(delayTime /amount) usingSpringWithDamping:usingSpringWithDampingTime initialSpringVelocity:initialSpringVelocityTime options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                cell.layer.opacity = 1.0;
                cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeShrinkToTop: {
            CGFloat durationTime = duration == 0 ? 0.5 : duration;
            
            CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
            cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
            [UIView animateWithDuration:durationTime animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            }];
            break;
        }
        case YXTableViewCellAnimationTypeLayDown: {
            CGFloat durationTime = duration == 0 ? 0.8 : duration;
            
            NSArray *cells = tableView.visibleCells;
            NSMutableArray *rectArr = [[NSMutableArray alloc] init];
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = cell.frame;
                [rectArr addObject:[NSValue valueWithCGRect:rect]];
                rect.origin.y = i *10;
                cell.frame = rect;
                cell.layer.transform = CATransform3DMakeTranslation(0, 0, i *5);
            }
            
            if (rectArr.count != 0) {
                CGRect rects = [[rectArr objectAtIndex:index] CGRectValue];
                [UIView animateWithDuration:(durationTime /amount) *index animations:^{
                    
                    cell.frame = rects;
                } completion:^(BOOL finished) {
                    
                    cell.layer.transform = CATransform3DIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeRote: {
            CGFloat durationTime = duration == 0 ? 0.1 : duration;
            CGFloat delayTime = delay == 0 ? 0.25 : delay;
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            animation.fromValue = @(-M_PI);
            animation.toValue = 0;
            animation.duration = 0.3;
            animation.removedOnCompletion = NO;
            animation.repeatCount = 3;
            animation.fillMode = kCAFillModeForwards;
            animation.autoreverses = NO;

            [UIView animateWithDuration:durationTime delay:index *delayTime options:0 animations:^{
                
                cell.alpha = 1.0;
            } completion:^(BOOL finished) {
                
                [cell.layer addAnimation:animation forKey:@"rotationYkey"];
            }];
            break;
        }
        default:
            break;
    }
}

@end
