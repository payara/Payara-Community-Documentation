# Security Fix List

| ID | Status | Summary | Observations |
| :--- | :--- | :--- | :--- |
| [CVE-2012-2098](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-2098) | N/A | Apache Commons Compress bzip2 vulnerability allows DDoS attacks | Payara Server does not make use of Apache Commons Compress |
| [CVE-2015-0254](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0254) | N/A | Vulnerabilities on Apache JSTL allows arbitrary code injection | Payara Server uses the FEATURE_SECURE_PROCESSING 
feature of JAXP so is not affected |
| [CVE-2015-5351](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-5351) | N/A | Apache Tomcat Manager Applications Session and CSRF token vulnerabilities | Unrelated to Payara Server since this affects specific Tomcat applications |
| [CVE-2016-0714](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-0714) | N/A | Session persistence in Apache Tomcat allows arbitrary code injection | Payara Server doesn't use the affected objects in the same way that Tomcat does so the flaw is not present |
| [CVE-2016-0714](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-0714) | N/A | Session persistence in Apache Tomcat allows arbitrary code injection | Payara Server doesn't use the affected objects in the same way that Tomcat does so the flaw is not present |
| [CVE-2016-6816](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6816) | N/A | Apache Tomcat HTTP request parsing vulnerability allow injection of data into reponse | Payara Server doesn't have included the Coyote components affected |





