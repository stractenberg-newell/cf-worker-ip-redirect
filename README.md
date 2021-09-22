# cf-worker-ip-redirect
Cloudflare Worker that redirects you to another website if your IP doesn't match one found in a KV Store

We use this so that employees in company offices and on VPN can access brand new domains before they're launched to the public, while the public is redirected to another public web site.  
It's also very handy if you need to send the world to a maintenance page, while company employees can access and work on the site.  
We used to use Zone Lockdown but prefer this worker. 
There are other examples of Workers that redirect based on country code, but we needed based on IP.  

REQUIREMENTS:
1. A KV Namespace with unique IPs per line in CSV format:

ipAddress1,ipAddress1  
ipAddress2,ipAddress2  
ipAddress3,ipAddress3  
...  

2. A KV Namespace Binding with:

Variable Name = "ALLOWED_IPS"  
KV namespace = "<whatever you named your namespace from Step 1 above>"  

3. Edit line 17 of ip_redirect.js with the URL you want the public to be redirected to

4. (OPTIONAL) If using "deploy_worker.sh" to publish the script to your Cloudflare account, enter the KV Namespace ID on line 7 of "metadata.json" first.

5. Map the route www.domain.com/* to the worker in Cloudflare
