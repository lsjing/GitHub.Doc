签名：/s demo.pfx 11111111 text.txt signDotNET.txt
签名：/s demo.pfx 11111111

验签：/v BOC-CA.cer  signDotNET.txt text.txt
         /v BOC-CA.cer  signDotNET.txt text.txt  "CN=测试商户, OU=TEST, O=BANK OF CHINA, C=CN"