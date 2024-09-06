//
//  JuspayCheckoutLite.m
//

#import "JuspayCheckoutLite.h"
#import "JuspayUtils.h"

@implementation JuspayCheckoutLite

static NSString* tenantServiceName;

+ (void)openPaymentPage:(UIViewController * _Nonnull)viewController payload:(NSDictionary * _Nonnull)sdkPayload callback:(JuspayPaymentsCallback _Nonnull)callback {
    tenantServiceName = sdkPayload[@"service"];
    NSDictionary *updatedPayload = [JuspayUtils updateServiceNameInPayload:sdkPayload tenantServiceName:tenantServiceName isResponse:false];
    [super openPaymentPage:viewController payload:updatedPayload callback:^(NSDictionary<NSString *,id> * _Nullable data) {
        NSDictionary *updatedResponse = [JuspayUtils updateServiceNameInPayload:data tenantServiceName:tenantServiceName isResponse:true];
        callback(updatedResponse);
    }];
}

@end
