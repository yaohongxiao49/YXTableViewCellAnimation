//
//  YXTableViewCellAnimation.h
//  YXTableViewCellAnimationTest
//
//  Created by ios on 2020/10/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** 基础宽 */
#define kTableViewCellAnimationBasicWidth [[UIScreen mainScreen] bounds].size.width
/** 基础高 */
#define kTableViewCellAnimationBasicHight [[UIScreen mainScreen] bounds].size.height

/** 动画类型 */
typedef NS_ENUM(NSUInteger, YXTableViewCellAnimationType) {
    /** 由左至右滑动动画 */
    YXTableViewCellAnimationTypeMove,
    /** 由左至右滑动动画（带弹性效果） */
    YXTableViewCellAnimationTypeSpring,
    /** 透明度动画 */
    YXTableViewCellAnimationTypeAlpha,
    /** 下落充满动画 */
    YXTableViewCellAnimationTypeFall,
    /** 左右交叉动画 */
    YXTableViewCellAnimationTypeShake,
    /** 上下翻转动画 */
    YXTableViewCellAnimationTypeOverTurn,
    /** 上升充满动画 */
    YXTableViewCellAnimationTypeToTop,
    /** 卷帘下落动画 */
    YXTableViewCellAnimationTypeSpringList,
    /** 上升挤满动画 */
    YXTableViewCellAnimationTypeShrinkToTop,
    /** 下落挤满动画 */
    YXTableViewCellAnimationTypeLayDown,
    /** 左右翻转动画 */
    YXTableViewCellAnimationTypeRote,
};

@interface YXTableViewCellAnimation : NSObject

/**
 * 初始时，显示动画
 * @param tableView 基础视图
 * @param animationType 显示动画类型
 * @param duration 持续时间
 * @param delay 延迟时间
 * @param usingSpringWithDamping 振动效果 0~1
 * @param initialSpringVelocity 初始的速度，数值越大一开始移动越快
 */
+ (void)initShowAnimationWithTableViewByType:(UITableView *)tableView
                               animationType:(YXTableViewCellAnimationType)animationType
                                    duration:(CGFloat)duration
                                       delay:(CGFloat)delay
                      usingSpringWithDamping:(CGFloat)usingSpringWithDamping
                       initialSpringVelocity:(CGFloat)initialSpringVelocity;

/**
 * 滚动时，显示动画
 * @param tableView 基础视图
 * @param cell 显示视图
 * @param animationType 显示动画类型
 * @param index 当前下标
 * @param amount 显示视图总数
 * @param duration 持续时间
 * @param delay 延迟时间
 * @param usingSpringWithDamping 振动效果 0~1
 * @param initialSpringVelocity 初始的速度，数值越大一开始移动越快
 */
+ (void)scrollShowAnimationWithTableViewCellByType:(UITableView *)tableView
                                              cell:(UITableViewCell *)cell
                                     animationType:(YXTableViewCellAnimationType)animationType
                                             index:(NSInteger)index
                                            amount:(NSInteger)amount
                                          duration:(CGFloat)duration
                                             delay:(CGFloat)delay
                            usingSpringWithDamping:(CGFloat)usingSpringWithDamping
                             initialSpringVelocity:(CGFloat)initialSpringVelocity;

@end

NS_ASSUME_NONNULL_END
