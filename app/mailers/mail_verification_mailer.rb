require 'net/smtp'


def mailVerficationFailed(_tutorEmail, _tutorName, _studentId, _studentName)

# SMTP Configuration
doutfireEmail = "doubtfire-sound@verification.com"
fromEmail = "jiangxinh1997@gmail.com"
password = "p@ssw0rdtest"
toEmail = "yangfeng7163@gmail.com"
toName = "Tutor"

# Student Details
studentId = "1234567"
studentName = "Jackson Lee"
dateNow = Time.now.strftime("%Y-%m-%d %H:%M")


smtp = Net::SMTP.new 'smtp.gmail.com', 587
smtp.enable_starttls

message = <<END_OF_MESSAGE
From: Doubtfire Sound Verification <#{doutfireEmail}>
To: #{toName} <#{toEmail}>
Subject: Sound Verification Failed
Content-Type: text/html

<body style="margin: 0; padding: 0;">
	<table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="padding: 20px 0 30px 0;">

<table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse; border: 1px solid #cccccc;">
	<tr>
		<td align="center" bgcolor="#ee4c50" style="padding: 40px 0 30px 0;">
			<img src="https://i.imgur.com/kqBq9Fk.png" width="55" height="70">
			<h1 style="color: white;">Sound Verification Failed</h2>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
			<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
				<tr>
					<td style="color: #153643; font-family: Arial, sans-serif;">
						<h1 style="font-size: 24px; margin: 0;">Hi there</h1>
					</td>
				</tr>
				<tr>
					<td style="color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0 30px 0;">
						<p style="margin: 0;">
							There is a sound verification failed detected by the system.
							Here is the information of the verification:
						</p>
					</td>
				</tr>
				<tr>
					<td class="grid-container" style="color: #153643; font-family: arial, sans-serif; font-size: 16px; line-height: 24px;">
						<table style="width: 100%;">
							<tr>
							<th style="width: 50%;"></th>
							<th></th>
							<th></th>
							</tr>
							<tr>
							<td style="text-align: right;"><strong>Student Id:</strong></td>
							<td></td>
							<td>#{studentId}</td>
							</tr>
							<tr>
							<td style="text-align: right;"><strong>Student Name:</strong></td>
							<td></td>
							<td>#{studentName}</td>
							</tr>
							<tr>
							<td style="text-align: right;"><strong>Verification Date:</strong></td>
							<td></td>
							<td>#{dateNow}</td>
							</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td style="color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px;">
						<br><br>
						Please take action immediately.<br><br>
						Regards,<br>
						Doubtfire<br><br>
						<strong>Note: </strong>		
						This is an automated system email. Please do not reply to this email.
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td bgcolor="#70bbd9" style="padding: 30px 30px;">
			<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
				<tr>
					<td style="color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; text-align: center;">
						<strong style="margin: 0;">&reg; Doutfire, Deakin 2021<br/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

			</td>
		</tr>
	</table>
</body>

END_OF_MESSAGE

smtp.start('testing', fromEmail, password, :plain)
smtp.send_message(message, doutfireEmail, toEmail)
smtp.finish()

end
