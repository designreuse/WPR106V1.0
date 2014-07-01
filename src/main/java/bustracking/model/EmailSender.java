package bustracking.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Component("emailSender")
public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngine velocityEngine;

	public static final String TEMPLATE_NAME = "sample_template.vm";
	
	public static final String TEMPLATE_NAME1 = "sample_template1.vm";
	
	public static final String TEMPLATE_NAME2 = "sample_template2.vm";

	public void sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject) {
		sendEmail(toEmailAddresses, fromEmailAddress, subject, null, null);
	}

	public void sendEmailWithAttachment(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String attachmentPath, final String attachmentName) {
		sendEmail(toEmailAddresses, fromEmailAddress, subject, attachmentPath,
				attachmentName);
	}

	private void sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String attachmentPath, final String attachmentName)
	{
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception 
			{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				String participantName = "Deemsys"; // select from databse
				String fromName = "Suresh"; // get from Mail settings Table
				model.put("toName", participantName);
				model.put("fromName", fromName);
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME, "UTF-8",
						model);
				message.setText(body, true);
				if (!StringUtils.isBlank(attachmentPath)) 
				{
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);
				}
			}
		};
		this.mailSender.send(preparator);
	}

	// Password Sending starts
	public void contact_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String firstname,final String lastname,final String email,final String organisation,final String mobile,final String address1,final String city,final String state) {
		pswd_sendEmail(toEmailAddresses, fromEmailAddress, subject, firstname, lastname, email, organisation, mobile,address1, city, state);
	}

	private void pswd_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String firstname,final String lastname,final String email,final String organisation,final String mobile,final String address1,final String city,final String state) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception
			{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				model.put("firstName", firstname);
				model.put("lastname", lastname);
				model.put("email", email);
				model.put("organisation", organisation);
				model.put("mobile", mobile);
				model.put("address1", address1);
				model.put("city", city);
				model.put("state", state);
			
				
				
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME, "UTF-8",
						model);
				message.setText(body, true);
				/*if (!StringUtils.isBlank(attachmentPath)) {
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);*/
			
			}
		};
		try
		{
		this.mailSender.send(preparator);
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
		
	}
	// Password Sending ends

	
	// Reply Mail Sending starts
	public void reply_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,final String firstname,final String lastname) {
		pswd_replyEmail(toEmailAddresses, fromEmailAddress, subject, firstname, lastname);
	}

	private void pswd_replyEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject, final String firstname, final String lastname) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception
			{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				model.put("firstName", firstname);
				model.put("lastname", lastname);
				/*model.put("email", email);
				model.put("organisation", organisation);
				model.put("mobile", mobile);
				model.put("address1", address1);
				model.put("address2", address2);
				model.put("city", city);
				model.put("state", state);*/
			
				
				
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME1, "UTF-8",
						model);
				message.setText(body, true);
				/*if (!StringUtils.isBlank(attachmentPath)) {
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);*/
			
			}
		};
		try
		{
		this.mailSender.send(preparator);
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
		
	}
	//Reply Mail Sending Ends
	
	//Organisation Mail Starts 
	public void org_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject) {
		org_Email(toEmailAddresses, fromEmailAddress, subject);
	}

	private void org_Email(final String toEmailAddresses,
			final String fromEmailAddress, final String subject) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception
			{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				/*model.put("firstName", firstname);
				model.put("lastname", lastname);
				model.put("email", email);
				model.put("organisation", organisation);
				model.put("mobile", mobile);
				model.put("address1", address1);
				model.put("address2", address2);
				model.put("city", city);
				model.put("state", state);*/
			
				
				
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME2, "UTF-8",
						model);
				message.setText(body, true);
				/*if (!StringUtils.isBlank(attachmentPath)) {
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);*/
			
			}
		};
		try
		{
		this.mailSender.send(preparator);
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
		
	}
	
	//Organization Mail Ends
}
