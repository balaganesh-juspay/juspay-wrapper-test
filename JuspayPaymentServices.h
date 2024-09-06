//
//  JuspayPaymentServices.h
//

#import <Foundation/Foundation.h>
#import <HyperSDK/Hyper.h>

NS_ASSUME_NONNULL_BEGIN

typedef HyperSDKCallback JuspayPaymentsCallback;

typedef HyperEventsCallback JuspaySDKEventsCallback;

@protocol JuspayDelegate <HyperDelegate>

@end

@interface JuspayPaymentServices : HyperServices

@property (nonatomic, weak) id <JuspayDelegate> _Nullable delegate;

- (instancetype _Nonnull)initWithClientId:(NSString * _Nonnull)clientId;

- (void)initiate:(UIViewController * _Nonnull)viewController payload:(NSDictionary * _Nonnull)initiationPayload callback:(JuspayPaymentsCallback _Nonnull)callback;

- (JuspaySDKEventsCallback _Nullable)merchantEvent;

@end

NS_ASSUME_NONNULL_END
