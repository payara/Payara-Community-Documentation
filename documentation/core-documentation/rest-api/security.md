
<a name="securityscheme"></a>
## Security

<a name="simple_auth"></a>
### simple_auth
Basic authentication using **Username** and **Password** credentials sent using the `Authorization` header.

*Type* : basic


<a name="token_cookie"></a>
### token_cookie
API Key authentication using a session token. In order to retrieve a session tokem, authenticate using the `simple_auth` security scheme to the `/management/sessions/` endpoint. Pass this token to the respective endpoint setting the `gfresttoken` cookie.

**IMPORTANT** - Since [OpenAPI v2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#securityRequirementObject) does not support cookies for API key security declaration, a *HEADER* definition is used as a placeholder.

*Type* : basic



