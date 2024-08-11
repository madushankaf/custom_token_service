import ballerina/http;


configurable string issuer = "";
configurable string token_endpoint = "";
configurable string authorization_endpoint = "";
configurable string introspection_endpoint = "";
configurable string revocation_endpoint = "";
configurable string userinfo_endpoint = "";
configurable string jwks_uri = "";
configurable string end_session_endpoint = "";

service / on new http:Listener(8080) {

    
    resource function get oauth2/token/wellknown/openidconfiguration() returns json {
        json config = {
            "issuer": issuer,
            "token_endpoint": token_endpoint,
            "authorization_endpoint": authorization_endpoint,
            "introspection_endpoint": introspection_endpoint,
            "revocation_endpoint": revocation_endpoint,
            "userinfo_endpoint": userinfo_endpoint,
            "jwks_uri": jwks_uri,
            "end_session_endpoint": end_session_endpoint,
            "grant_types_supported": ["authorization_code", "client_credentials", "refresh_token", "urn:ietf:params:oauth:grant-type:token-exchange"],
            "scopes_supported": ["oidc"],
            "response_types_supported": ["code"],
            "response_modes_supported": ["query", "fragment", "form_post"],
            "subject_types_supported": ["public"],
            "code_challenge_methods_supported": ["S256"],
            "userinfo_signing_alg_values_supported": ["S256"],
            "id_token_signing_alg_values_supported": ["RS256"],
            "token_endpoint_auth_methods_supported": ["client_secret_basic", "client_secret_post"],
            "introspection_endpoint_auth_methods_supported": ["client_secret_basic", "client_secret_post"],
            "revocation_endpoint_auth_methods_supported": ["client_secret_basic", "client_secret_post"]
        };

        return config;

    }

}
