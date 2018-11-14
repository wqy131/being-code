package com.being.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SMSController {
//	public static void main(String[] args) {
//		AmazonSNS snsClient = AmazonSNSClientBuilder.defaultClient();
//		setDefaultSmsAttributes(snsClient);
//	}
//
//	public static void setDefaultSmsAttributes(AmazonSNSClient snsClient) {
//		SetSMSAttributesRequest setRequest = new SetSMSAttributesRequest()
//				.addAttributesEntry("DefaultSenderID", "mySenderID")
//				.addAttributesEntry("MonthlySpendLimit", "1")
//				.addAttributesEntry("DeliveryStatusIAMRole", 
//						"arn:aws:iam::123456789012:role/mySnsRole")
//				.addAttributesEntry("DeliveryStatusSuccessSamplingRate", "10")
//				.addAttributesEntry("DefaultSMSType", "Transactional")
//				.addAttributesEntry("UsageReportS3Bucket", "sns-sms-daily-usage");
//		snsClient.setSMSAttributes(setRequest);
//		Map<String, String> myAttributes = snsClient.getSMSAttributes(new GetSMSAttributesRequest())
//			.getAttributes();
//		System.out.println("My SMS attributes:");
//		for (String key : myAttributes.keySet()) {
//			System.out.println(key + " = " + myAttributes.get(key));
//		}
//	}
	
	@RequestMapping(value="/testPathVariable/{id}/aaa")  
    public String testPathVariable(@PathVariable("id") Integer id) {  
        System.out.println("testPathVariable:" + id);  
        return "success";  
    }  
}
