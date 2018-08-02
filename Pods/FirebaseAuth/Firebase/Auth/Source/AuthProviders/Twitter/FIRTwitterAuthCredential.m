/*
 * Copyright 2017 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FIRTwitterAuthCredential.h"

#import "FIRTwitterAuthProvider.h"
#import "FIRAuthExceptionUtils.h"
#import "FIRVerifyAssertionRequest.h"

@interface FIRTwitterAuthCredential ()

- (nullable instancetype)initWithProvider:(NSString *)provider NS_UNAVAILABLE;

@end

@implementation FIRTwitterAuthCredential

- (nullable instancetype)initWithProvider:(NSString *)provider {
  [FIRAuthExceptionUtils raiseMethodNotImplementedExceptionWithReason:
      @"Please call the designated initializer."];
  return nil;
}

- (nullable instancetype)initWithToken:(NSString *)token secret:(NSString *)secret {
  self = [super initWithProvider:FIRTwitterAuthProviderID];
  if (self) {
    _token = [token copy];
    _secret = [secret copy];
  }
  return self;
}

- (void)prepareVerifyAssertionRequest:(FIRVerifyAssertionRequest *)request {
  request.providerAccessToken = _token;
  request.providerOAuthTokenSecret = _secret;
}

@end
