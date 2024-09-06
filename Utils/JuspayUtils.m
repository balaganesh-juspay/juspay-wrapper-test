//
//  JuspayUtils.m
//

#import "JuspayUtils.h"
#import "JuspayConstants.h"

@implementation JuspayUtils

+ (NSDictionary *)updateServiceNameInPayload:(NSDictionary *)payload tenantServiceName:(NSString *)tenantServiceName isResponse:(BOOL)isResponse {
    NSString *serviceName = payload[@"service"];
    if (serviceName) {
        BOOL serviceNameChanged = false;
        if (isResponse && ![tenantServiceName containsString:Juspay_HYPER_SERVICE_PREFIX]) {
            serviceName = [serviceName stringByReplacingOccurrencesOfString:Juspay_HYPER_SERVICE_PREFIX withString:@""];
            serviceNameChanged = true;
        } else if (![serviceName containsString:Juspay_HYPER_SERVICE_PREFIX]) {
            serviceName = [NSString stringWithFormat:@"%@%@", Juspay_HYPER_SERVICE_PREFIX, serviceName];
            serviceNameChanged = true;
        }
        
        if (!serviceNameChanged) {
            return payload;
        }
        
        NSMutableDictionary *updatedPayload = [NSMutableDictionary dictionaryWithDictionary:payload];
        updatedPayload[@"service"] = serviceName;
        
        return updatedPayload;
    }
    return payload;
}

@end
