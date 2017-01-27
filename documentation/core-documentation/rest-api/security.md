
<a name="securityscheme"></a>
## Security

<a name="simple_auth"></a>
### simple_auth
Basic authentication using **Username** and **Password** credentials sent using the `Authorization` header.

*Type* : basic


<a name="token_cookie"></a>
### token_cookie
API Key authentication using a session token. In order to retrieve a session tokem, authenticate using the `simple_auth` security scheme to the `/management/sessions/` endpoint. Pass this token to the respective endpoint setting the `gfresttoken` cookie.

**IMPORTANT** - Since *OpenAPI* does not support cookies to trasmit the API key as a token, this scheme is configured to pass the key in the header.
      
*Type* : apiKey  
*Name* : gfresttoken  
*In* : HEADER



