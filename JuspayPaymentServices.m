//
//  JuspayPaymentServices.m
//

#import "JuspayPaymentServices.h"
#import "JuspayUtils.h"
#import "JuspayConstants.h"

@interface JuspayPaymentServices()

@property (nonatomic, strong) NSString *tenantServiceName;

@end

@implementation JuspayPaymentServices

- (instancetype)init
{
    HyperTenantParams *tenantParams = [[HyperTenantParams alloc] init];
    tenantParams.tenantId = Juspay_HYPER_TENANT_ID;
    tenantParams.releaseConfigURL = Juspay_HYPER_RELEASE_CONFIG_URL;
    
    self = [super initWithTenantParams:tenantParams];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithClientId:(NSString *)clientId {
    HyperTenantParams *tenantParams = [[HyperTenantParams alloc] init];
    tenantParams.clientId = clientId;
    tenantParams.tenantId = Juspay_HYPER_TENANT_ID;
    tenantParams.releaseConfigURL = Juspay_HYPER_RELEASE_CONFIG_URL;
    
    self = [super initWithTenantParams:tenantParams];
    if (self) {
        
    }
    return self;
}

- (void)initiate:(UIViewController *)viewController payload:(NSDictionary *)initiationPayload callback:(JuspayPaymentsCallback)callback {
    self.tenantServiceName = initiationPayload[@"service"];
    NSDictionary *updatedPayload = [JuspayUtils updateServiceNameInPayload:initiationPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super initiate:viewController payload:updatedPayload callback:^(NSDictionary<NSString *,id> * _Nullable data) {
        NSDictionary *updatedResponse = [JuspayUtils updateServiceNameInPayload:data tenantServiceName:self.tenantServiceName isResponse:true];
        callback(updatedResponse);
    }];
}

- (void)process:(UIViewController *)viewController processPayload:(NSDictionary *)processPayload {
    NSDictionary *updatedPayload = [JuspayUtils updateServiceNameInPayload:processPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super process:viewController processPayload:updatedPayload];
}

- (void)process:(NSDictionary *)processPayload {
    NSDictionary *updatedPayload = [JuspayUtils updateServiceNameInPayload:processPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super process:updatedPayload];
}

- (JuspaySDKEventsCallback)merchantEvent {
    return [super merchantEvent];
}

- (void)setDelegate:(id<JuspayDelegate>)delegate {
    [super setHyperDelegate:delegate];
    _delegate = delegate;
}

@end
