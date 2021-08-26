# Meraki, Okta and AWS VPN Architecture 

This is an example of some of my work leading a VPN re-architecture. We deployed RADIUS agents on three EC2 instances across three availability zones and also load balanced the UDP traffic using a network load balancer. All traffic is logged using a Cloudwatch agent and the RADIUS agent process is monitored using a Datadog process monitor. 

Here is a run down of how the traffic flows through the architecture. 

1. The VPN authentication requests point to a Meraki network appliance. 
2. The Meraki appliance points to the network load balancer hosted in AWS.
3. The network load balancer routes the UDP traffic to one of three EC2 instances hosted within an AZ.
4. The RADIUS agent installed on the EC2 instances checks against Okta to verify that the user credentials are either accepted or rejected.
5. The request is then routed back to the user and allows or denies VPN access based on the evaluation of the credentials. 

Reference documentation: https://help.okta.com/en/prod/Content/Topics/integrations/getting-started.htm

![Alt text](./radius-agent-server.svg)
