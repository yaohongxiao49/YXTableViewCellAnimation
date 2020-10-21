//
//  YXTableViewCellAnimation.m
//  YXTableViewCellAnimationTest
//
//  Created by ios on 2020/10/21.
//

#import "YXTableViewCellAnimation.h"

@implementation YXTableViewCellAnimation

#pragma mark - 初始时，显示动画
+ (void)initShowAnimationWithTableViewByType:(UITableView *)tableView animationType:(YXTableViewCellAnimationType)animationType {
    
    NSArray *cells = tableView.visibleCells;
    switch (animationType) {
        case YXTableViewCellAnimationTypeMove: {
            for (int i = 0; i < cells.count; i++) {
                CGFloat totalTime = 0.3;
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                [UIView animateWithDuration:0.25 delay:i *(totalTime /cells.count) options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeSpring: {
            for (int i = 0; i < cells.count; i++) {
                CGFloat totalTime = 0.4;
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                [UIView animateWithDuration:0.4 delay:i *(totalTime /cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1 /0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeAlpha: {
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.alpha = 0.0;
                [UIView animateWithDuration:0.3 delay:i *0.05 options:0 animations:^{
                    
                    cell.alpha = 1.0;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeFall: {
            NSTimeInterval totalTime = 0.8;
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(0, -kTableViewCellAnimationBasicWidth);
                [UIView animateWithDuration:0.3 delay:(cells.count -i) *(totalTime /cells.count) options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeShake: {
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                if (i %2 == 0) {
                    cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
                }
                else {
                    cell.transform = CGAffineTransformMakeTranslation(kTableViewCellAnimationBasicWidth, 0);
                }
                [UIView animateWithDuration:0.4 delay:i *0.03 usingSpringWithDamping:0.75 initialSpringVelocity:1 /0.75 options:0 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeOverTurn: {
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                cell.layer.opacity = 0.0;
                cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
                NSTimeInterval totalTime = 0.7;
                [UIView animateWithDuration:0.3 delay:i *(totalTime /cells.count) options:0 animations:^{
                    
                    cell.layer.opacity = 1.0;
                    cell.layer.transform = CATransform3DIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeToTop: {
            NSTimeInterval totalTime = 0.8;
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
                cell.transform = CGAffineTransformMakeTranslation(0, kTableViewCellAnimationBasicHight);
                [UIView animateWithDuration:0.35 delay:i *(totalTime /cells.count) options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeSpringList: {
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                cell.layer.opacity = 0.7;
                cell.layer.transform = CATransform3DMakeTranslation(0, -kTableViewCellAnimationBasicHight, 20);
                NSTimeInterval totalTime = 1.0;
                [UIView animateWithDuration:0.4 delay:i *(totalTime /cells.count) usingSpringWithDamping:0.65 initialSpringVelocity:1 /0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    cell.layer.opacity = 1.0;
                    cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
                } completion:^(BOOL finished) {}];
            }
            break;
        }
        case YXTableViewCellAnimationTypeShrinkToTop: {
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
                cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
                [UIView animateWithDuration:0.5 animations:^{
                    
                    cell.transform = CGAffineTransformIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeLayDown: {
            NSMutableArray *rectArr = [[NSMutableArray alloc] init];
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = cell.frame;
                [rectArr addObject:[NSValue valueWithCGRect:rect]];
                rect.origin.y = i *10;
                cell.frame = rect;
                cell.layer.transform = CATransform3DMakeTranslation(0, 0, i *5);
            }
            
            NSTimeInterval totalTime = 0.8;
            for (int i = 0; i < cells.count; i++) {
                UITableViewCell *cell = [cells objectAtIndex:i];
                CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
                [UIView animateWithDuration:(totalTime /cells.count) *i animations:^{
                    
                    cell.frame = rect;
                } completion:^(BOOL finished) {
                    
                    cell.layer.transform = CATransform3DIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeRote: {
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
                [UIView animateWithDuration:0.1 delay:i *0.25 options:0 animations:^{
                    
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
+ (void)scrollShowAnimationWithTableViewCellByType:(UITableView *)tableView cell:(UITableViewCell *)cell animationType:(YXTableViewCellAnimationType)animationType index:(NSInteger)index amount:(NSInteger)amount {
    
    switch (animationType) {
        case YXTableViewCellAnimationTypeMove: {
            CGFloat totalTime = 0.3;
            cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            [UIView animateWithDuration:0.25 delay:index *(totalTime /amount) options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeSpring: {
            CGFloat totalTime = 0.4;
            cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            [UIView animateWithDuration:0.4 delay:index *(totalTime /amount) usingSpringWithDamping:0.7 initialSpringVelocity:1 /0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeAlpha: {
            cell.alpha = 0.0;
            [UIView animateWithDuration:0.3 delay:index *0.05 options:0 animations:^{
                
                cell.alpha = 1.0;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeFall: {
            NSTimeInterval totalTime = 0.8;
            cell.transform = CGAffineTransformMakeTranslation(0, -kTableViewCellAnimationBasicWidth);
            [UIView animateWithDuration:0.3 delay:(amount -index) *(totalTime /amount) options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeShake: {
            if (index %2 == 0) {
                cell.transform = CGAffineTransformMakeTranslation(-kTableViewCellAnimationBasicWidth, 0);
            }
            else {
                cell.transform = CGAffineTransformMakeTranslation(kTableViewCellAnimationBasicWidth, 0);
            }
            [UIView animateWithDuration:0.4 delay:index *0.03 usingSpringWithDamping:0.75 initialSpringVelocity:1 /0.75 options:0 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeOverTurn: {
            cell.layer.opacity = 0.0;
            cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
            NSTimeInterval totalTime = 0.7;
            [UIView animateWithDuration:0.3 delay:index *(totalTime /amount) options:0 animations:^{
                
                cell.layer.opacity = 1.0;
                cell.layer.transform = CATransform3DIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeToTop: {
            NSTimeInterval totalTime = 0.8;
            cell.transform = CGAffineTransformMakeTranslation(0, kTableViewCellAnimationBasicHight);
            [UIView animateWithDuration:0.35 delay:index *(totalTime /amount) options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeSpringList: {
            cell.layer.opacity = 0.7;
            cell.layer.transform = CATransform3DMakeTranslation(0, -kTableViewCellAnimationBasicHight, 20);
            NSTimeInterval totalTime = 1.0;
            [UIView animateWithDuration:0.4 delay:index *(totalTime /amount) usingSpringWithDamping:0.65 initialSpringVelocity:1 /0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                cell.layer.opacity = 1.0;
                cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
            } completion:^(BOOL finished) {}];
            break;
        }
        case YXTableViewCellAnimationTypeShrinkToTop: {
            CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
            cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
            [UIView animateWithDuration:0.5 animations:^{
                
                cell.transform = CGAffineTransformIdentity;
            }];
            break;
        }
        case YXTableViewCellAnimationTypeLayDown: {
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
                NSTimeInterval totalTime = 0.8;
                CGRect rects = [[rectArr objectAtIndex:index] CGRectValue];
                [UIView animateWithDuration:(totalTime /amount) *index animations:^{
                    
                    cell.frame = rects;
                } completion:^(BOOL finished) {
                    
                    cell.layer.transform = CATransform3DIdentity;
                }];
            }
            break;
        }
        case YXTableViewCellAnimationTypeRote: {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            animation.fromValue = @(-M_PI);
            animation.toValue = 0;
            animation.duration = 0.3;
            animation.removedOnCompletion = NO;
            animation.repeatCount = 3;
            animation.fillMode = kCAFillModeForwards;
            animation.autoreverses = NO;

            cell.alpha = 0.0;
            [UIView animateWithDuration:0.1 delay:index *0.25 options:0 animations:^{
                
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
