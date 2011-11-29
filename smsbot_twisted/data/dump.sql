BEGIN TRANSACTION;
CREATE TABLE sessions (
	"Id" VARCHAR(36) NOT NULL, 
	"Participant" VARCHAR(36) NOT NULL, 
	"Start" DATETIME, 
	"End" DATETIME, 
	"Description" VARCHAR(1024), 
	PRIMARY KEY ("Id")
);
CREATE TABLE participants (
	"Id" VARCHAR(36) NOT NULL, 
	"CaseNumber" VARCHAR(128), 
	"ParentName" VARCHAR(256), 
	"MobileNumberA" VARCHAR(36), 
	"MobileNumberB" VARCHAR(36), 
	"MobileNumberC" VARCHAR(36), 
	"MobileNumberD" VARCHAR(36), 
	"MobileNumberE" VARCHAR(36), 
	"Group" VARCHAR(36), 
	"VisitorName" VARCHAR(256), 
	"VisitorMobileNumber" VARCHAR(36), 
	PRIMARY KEY ("Id")
);
INSERT INTO "participants" VALUES('13a60dc6-2de5-4d4e-a0dc-352af4457e09', '1919191919', 'Chris Karr', '(847) 770-0637', '', '', '', '', 'Administrators', '', '(312) 339-6771');
INSERT INTO "participants" VALUES('2c2a70bf-d808-4291-99d0-3c2496cf77e5', '0001', 'Micere', '847-409-2757', '', '', '', '', 'Administrators', '', '');
INSERT INTO "participants" VALUES('80a9e20c-7bc0-4330-80cf-71754d03da78', '0002', 'D65_1', '847-730-7314', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('c487f669-a8e4-446c-8d24-3b2caeac56cb', '0003', 'D65_2', '847-533-1729', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('a4067eec-6c7e-44a7-90a5-9e8bc93a358e', '0004', 'Lisa', '224-220-6684', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('01be68a4-57b9-4b82-8d1b-8732ffdd95df', '0005', 'Kate', '847-530-3742', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('4eef861d-998b-4ef3-bca9-3d118978cb9f', '0006', 'Aelyn', '224-220-6679', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('26f72f04-d12c-4ccc-828a-9b3b9d69b072', '0007', 'Michael', '773-319-9759', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('0a981c16-3c23-4399-b22a-9a42a945a62f', '0008', 'Val', '954-701-6889', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('4ef177b6-358e-44cc-b493-2e3db504beeb', '0009', 'Susan', '847-630-1104', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('ae5916c0-df49-4902-966c-747817c517e5', '0010', 'Jennifer', '773-960-8723', '', '', '', '', 'Administrators', '', '');
INSERT INTO "participants" VALUES('2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '0012', 'Chris Karr (Droid)', '(312) 339-6771', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('74287e79-e01c-4170-ac84-94b265775cf3', '0013', 'Christina', '224-220-6862', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('76059dcc-66dc-4131-93c7-c35eb40c3cd3', '99999999', 'Chris Karr (Palm Pre)', '(312) 898-0321', '', '', '', '', '0-12', '', '');
INSERT INTO "participants" VALUES('81c93fb3-16f6-4e98-add8-c0767fcd81f5', NULL, 'New Participant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CREATE TABLE tips (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"First" VARCHAR(256), 
	"Second" VARCHAR(256), 
	"Third" VARCHAR(256), 
	PRIMARY KEY ("Id")
);
INSERT INTO "tips" VALUES('40ea6f95-663b-4484-8219-ab3fdb97159f', 'Welcome', 'We are Text-4-Parenting & for the next 2 weeks u will be receiving trial text messages to test the benefits of text messaged parenting tips. REPLY 1 TO CONFIRM', 'Please add text-4-parenting to ur phone so that u will know when we are contacting u. REPLY 1 TO CONFIRM', 'Send us a text message if u have any questions');
INSERT INTO "tips" VALUES('a99a155d-29be-4d3f-963d-95752c0204f0', 'Parenting Tip', 'Storytelling & reading books to baby are good ways to spark ur baby''s imagination. When reading take time to show the pictures to ur baby & REPLY 1 FOR MORE', '& name the objects in the pictures. When storytelling, try acting out parts of the story & use baby''s name for the main character in the story. REPLY 1 FOR MORE', 'Reading & storytelling are important because they increase baby''s thinking & lay the foundation for the future of ur baby''s creative imagination.');
INSERT INTO "tips" VALUES('5c2aaee7-3673-4cb2-baca-34db619ccf78', 'Baby Grab', 'I am sure u have noticed that ur baby wants to reach out, touch & grab everything. This is part of their natural curiosity. REPLY 1 FOR MORE', 'Reaching out & grabbing something takes a lot of work. It takes planning, hand eye coordination, strength, & motor skills.  REPLY 1 FOR MORE', 'It''s our job as baby''s first teacher to give baby lots of chances to touch, grab, & drop many different safe objects. Make a safe space & then let baby explore.');
INSERT INTO "tips" VALUES('9a9723da-bbf9-4452-88a5-43d85c3dfca8', 'Baby Motor', 'Let''s help baby build the motor skills that are need to stack blocks when baby gets older. Give baby several blocks, books & rings of different REPLY 1 FOR MORE', 'different sizes, shapes, & colors, & let baby explore them. Talk to baby about how the objects feel. Let baby squeeze the soft one & say soft, REPLY 1 FOR MORE', 'then let baby squeeze the hard one & say hard. Also show & say big & small. Show baby that they can bang together to make sounds & then let baby try.');
INSERT INTO "tips" VALUES('47da0ab1-ace6-4add-a627-50c94a034877', 'Conversation Turn-Taking', 'Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE', 'process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE', 'If baby only babbles, copy baby''s sounds. If baby can talk use the words baby knows how to say. Doing what baby can already do will keep him/her involved longer');
INSERT INTO "tips" VALUES('1c692169-fcde-4bee-8f19-dbb4594f0049', 'New Tip', NULL, NULL, NULL);
CREATE TABLE prompts (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"First" VARCHAR(256), 
	"Second" VARCHAR(256), 
	PRIMARY KEY ("Id")
);
INSERT INTO "prompts" VALUES('0bb2c8f0-979d-4a92-bb30-aa2b6ebcd1b2', 'Behavior', 'Let''s do some imagination building. Read a book aloud to baby today. Try using a different voice & facial expression for each character REPLY 1 FOR MORE ', 'For more fun put a sock on ur hand & have sock puppet do the talking. This will keep baby interested in the story, & build baby''s thinking & imagination.');
INSERT INTO "prompts" VALUES('b2417b58-222a-443f-a118-2d18294d66b3', 'Bath Talk', 'At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE ', 'Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
CREATE TABLE followups (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"Question" VARCHAR(256), 
	"Positive" VARCHAR(256), 
	"Negative" VARCHAR(256), 
	PRIMARY KEY ("Id")
);
INSERT INTO "followups" VALUES('daa3e6cd-916f-4baf-83b0-6a99ebb866e1', 'Motor Followup', 'Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO. ', 'Good job, u are baby''s first teacher? REPLY 1 FOR YES; REPLY 2 FOR NO.', 'Try again on Thursday & Friday when we send more tips & ideas.');
CREATE TABLE broadcasts (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"Message" VARCHAR(256), 
	PRIMARY KEY ("Id")
);
INSERT INTO "broadcasts" VALUES('86add4d3-b055-4633-b1c2-2a0b702d118a', '411 Tip', 'Have a parenting question??? Just reply with 411 & add your question.');
CREATE TABLE scripts (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"Script" VARCHAR(4098), 
	PRIMARY KEY ("Id")
);
INSERT INTO "scripts" VALUES('a5a5db94-7ab5-4be8-85a0-83368d76f428', 'Edinburgh Post Natal Depression Screening (EPDS-3)', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scripts" VALUES('cf530b5a-26b5-47dc-9be3-7605af4f17bd', 'Reminder test', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="first_question" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
CREATE TABLE schedule (
	"Id" VARCHAR(36) NOT NULL, 
	"Date" DATETIME, 
	"Session" VARCHAR(36), 
	PRIMARY KEY ("Id")
);
CREATE TABLE schedule_context (
	"Id" VARCHAR(36) NOT NULL, 
	"Schedule" VARCHAR(36), 
	"Key" VARCHAR(36), 
	"Value" VARCHAR(1024), 
	"Type" VARCHAR(64), 
	PRIMARY KEY ("Id")
);
CREATE TABLE scheduled_scripts (
	"Id" VARCHAR(36) NOT NULL, 
	"Recipient" VARCHAR(36), 
	"Date" DATETIME, 
	"Executed" DATETIME, 
	"ScriptId" VARCHAR(36), 
	"Script" VARCHAR(4096), 
	PRIMARY KEY ("Id")
);
INSERT INTO "scheduled_scripts" VALUES('208b620a-990f-4053-a8a7-38b383e76adc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 00:00:00.000000', '2010-09-23 07:58:41.663508', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('fe1cfb64-9a26-482b-b8d6-2a00369c7e5e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 00:00:00.000000', '2010-09-23 08:00:23.215829', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('b74d4ad9-2de6-42be-8a3c-22e5144d4990', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:15:00.000000', '2010-09-23 08:15:23.215093', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('18b6a456-8dd1-4937-a149-547ca904c63c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:30:00.000000', '2010-09-23 10:30:05.162868', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('6b0122f5-6190-40bc-8cbf-8653f29cba54', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 10:32:00.000000', '2010-09-23 10:32:05.162679', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('079c54e6-1869-498e-ba56-96bf14471d95', '80a9e20c-7bc0-4330-80cf-71754d03da78', '2010-09-23 10:34:00.000000', '2010-09-23 10:34:05.162503', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('16917038-5202-4d2b-991c-f657cbbd51bb', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', '2010-09-23 10:36:00.000000', '2010-09-23 10:36:05.163297', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('fb37786d-31e8-4d22-8d16-17afff37e673', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', '2010-09-23 10:38:00.000000', '2010-09-23 10:38:05.163130', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('9f18ad72-a77c-4698-807b-9a45714bead3', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', '2010-09-23 10:40:00.000000', '2010-09-23 10:40:05.163015', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('3eaecf3e-fa16-415b-9f5c-42d77f3d3e62', '4eef861d-998b-4ef3-bca9-3d118978cb9f', '2010-09-23 10:42:00.000000', '2010-09-23 10:42:05.162857', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('58f587ca-0648-40fc-9bca-cf1686a84644', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-23 10:44:00.000000', '2010-09-23 10:44:05.162703', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('e0f45a5f-6984-4c43-bc5b-c70f62caede7', '0a981c16-3c23-4399-b22a-9a42a945a62f', '2010-09-23 10:46:00.000000', '2010-09-23 10:46:05.162556', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('e6124348-b343-406e-879d-c16e77127404', '4ef177b6-358e-44cc-b493-2e3db504beeb', '2010-09-23 10:48:00.000000', '2010-09-23 10:48:05.163321', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('a1a29001-9c0e-4143-86ef-0bea453f2bce', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-23 10:50:00.000000', '2010-09-23 10:50:05.163128', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('03e94b86-f4f2-4ef7-894b-13416bf8aca7', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:52:00.000000', '2010-09-23 10:52:05.163030', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('c68142cb-73b8-4c8b-a211-6496f656e16a', '74287e79-e01c-4170-ac84-94b265775cf3', '2010-09-23 10:54:00.000000', '2010-09-23 10:54:05.162848', 'a5a5db94-7ab5-4be8-85a0-83368d76f428', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="ready" smsbot:variable="epnds:ready">
			<grammar>1</grammar>
			<prompt>
				We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.
			</prompt>
		</field>
		<field name="continue" smsbot:variable="epnds:continue">
			<prompt>
				You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.
			</prompt>
			<grammar>1</grammar>
			<filled>
				Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.
			</filled>
		</field>
		<field name="blame" smsbot:variable="epnds:blame">
			<prompt>
				Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="anxious" smsbot:variable="epnds:anxious">
			<prompt>
				Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4
			</prompt>
			<grammar>1|2|3|4</grammar>
		</field>
		<field name="afraid" smsbot:variable="epnds:afraid">
			<prompt>
				Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4
			</prompt>
			<grammar>1|2|3|4</grammar>
			<filled>
				Thank you for completing this survey!
			</filled>
		</field>
	</form>
</vxml>
');
INSERT INTO "scheduled_scripts" VALUES('9937d414-0bb0-4c2e-9623-2446f6220f2e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:03:01.113324', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<block>It seems so....</block>
				<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
				<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder" />
				<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
				<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('0490a5b3-f466-4f75-9946-94297934cb5f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:07:01.112895', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder" />
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('0f392480-709b-4261-b583-56188326ccee', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:11:34.861601', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder" />
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('f5206f57-6635-434a-866e-a0432c2b74bb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:15:20.709372', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder" />
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('428a07bf-319f-48ed-a23b-25f1fb53fb55', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:18:30.995197', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder" />
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('52e69e11-399b-43b8-83c1-9ee63275f3d3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:20:23.325688', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('fb23a2b7-9406-4531-b2ee-b02bf3638825', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:22:08.698704', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('c9a02581-6184-43e1-956b-af0745cf26cf', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:36:40.115192', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('2864aed1-8513-42da-9f5c-49c2cf2ab702', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:38:36.199321', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('c3ad40ac-a318-4d62-8bbb-636c6b8dc347', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:41:02.182857', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('eb341e1a-b065-4894-bfc9-11ee55760be9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:48:34.664582', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('a7c700bc-f0ea-489b-92c5-409b853680e2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:52:20.069055', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="one" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('5ca8344a-805e-4213-95e6-55ce372add2d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 10:54:20.068838', 'cf530b5a-26b5-47dc-9be3-7605af4f17bd', '<?xml version="1.0" encoding="utf-8"?>
<vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="first_question" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>It seems so....</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from CASE_NUMBER...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:variable="reminder">REMINDER TEXT HERE</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from CASE_NUMBER:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question" />
					<else />
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('212bbce7-4919-4d72-a798-415347fff85d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 14:59:22.134623', 'b260c0ad-0aad-4fbe-a02e-469e143107c4', '<?xml version="1.0" ?><vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder" smsbot:case_id="1234">
		<field name="first_question" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Does this reminder work?Will you be able to meet with your home visitor tomorrow as previously scheduled?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>Thanks for letting us know. Your response has been forwarded to your visitor.</block>
					<smsbot:send smsbot:dest="13128980321">Reminder response from --CASE_NUMBER--...</smsbot:send>
					<smsbot:send smsbot:dest="13128980321" smsbot:message="reminder">Will you be able to meet with your home visitor tomorrow as previously scheduled?</smsbot:send>
					<smsbot:send smsbot:dest="13128980321">Response from --CASE_NUMBER--:</smsbot:send>
					<smsbot:send_variable smsbot:dest="13128980321" smsbot:variable="first_question"/>
					<else/>
					<block>Shouldn''t be here.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('074c7c06-feaa-40c9-b6b2-d92ed4ddf96d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 00:00:00.000000', '2010-09-28 15:07:20.586296', 'b260c0ad-0aad-4fbe-a02e-469e143107c4', '<?xml version="1.0" ?><vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder">
		<field name="first_question" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Will you be able to meet with your home visitor tomorrow as previously scheduled?</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>Thanks for letting us know. Your response has been forwarded to your visitor.</block>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="prompt">Received reminder response from #1919191919...</smsbot:send>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="reminder">Will you be able to meet with your home visitor tomorrow as previously scheduled?</smsbot:send>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="response">#1919191919 response:</smsbot:send>
					<smsbot:send_variable smsbot:dest="(312) 339-6771" smsbot:variable="first_question"/>
					<else/>
					<block>Error. Please notify the study administrators about this message.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('71b8b5eb-5c77-41b9-9edb-56a93bb04f2d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 15:15:00.000000', '2010-09-28 15:15:20.586768', 'b260c0ad-0aad-4fbe-a02e-469e143107c4', '<?xml version="1.0" ?><vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="reminder">
		<field name="first_question" smsbot:message="one" smsbot:variable="first_question">
			<prompt>Will you be able to meet with your home visitor tomorrow as previously scheduled? If not, please give a brief explanation why.</prompt>
			<filled>
				<if cond="1 &gt; 0">
					<block>Thanks for letting us know. Your response has been forwarded to your visitor.</block>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="prompt">Received reminder response from #1919191919...</smsbot:send>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="reminder">Will you be able to meet with your home visitor tomorrow as previously scheduled? If not, please give a brief explanation why.</smsbot:send>
					<smsbot:send smsbot:dest="(312) 339-6771" smsbot:message="response">#1919191919 response:</smsbot:send>
					<smsbot:send_variable smsbot:dest="(312) 339-6771" smsbot:variable="first_question"/>
					<else/>
					<block>Error. Please notify the study administrators about this message.</block>
				</if>
			</filled>
		</field>
	</form>
</vxml>');
INSERT INTO "scheduled_scripts" VALUES('faa0baf2-91b0-445d-bde4-86eeb5d038e7', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-10-08 11:24:00.000000', '2010-10-08 11:28:02.982227', 'a99a155d-29be-4d3f-963d-95752c0204f0', '<?xml version="1.0" ?><vxml version="1.0" xmlns:smsbot="http://www.audacious-software.com/smsbot">
	<form id="tip">
		<field name="first" smsbot:message="first" smsbot:variable="Parenting Tip:first_tip">
			<prompt>Storytelling &amp; reading books to baby are good ways to spark ur baby''s imagination. When reading take time to show the pictures to ur baby &amp; REPLY 1 FOR MORE</prompt>
			<grammar>1</grammar>
		</field>
		<field name="second" smsbot:message="second" smsbot:variable="Parenting Tip:second_tip">
			<prompt>&amp; name the objects in the pictures. When storytelling, try acting out parts of the story &amp; use baby''s name for the main character in the story. REPLY 1 FOR MORE</prompt>
			<grammar>1</grammar>
		</field>
		<block smsbot:message="third">Reading &amp; storytelling are important because they increase baby''s thinking &amp; lay the foundation for the future of ur baby''s creative imagination.</block>
	</form>
</vxml>');
CREATE TABLE events (
	"Id" VARCHAR(36) NOT NULL, 
	"Participant" VARCHAR(36), 
	"Type" VARCHAR(36), 
	"Date" DATETIME, 
	"Description" VARCHAR(4096), 
	PRIMARY KEY ("Id")
);
INSERT INTO "events" VALUES('e6e0c0e7-109b-4865-8255-d83d1ec21f3d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 01:32:09.006493', 'Sending mesaage to (+18477700637): Have a parenting question??? Just reply with 411 & add your question.');
INSERT INTO "events" VALUES('c801d23d-d97b-4e9f-b9c4-bd3633b7167f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 01:35:27.365510', 'Scheduled message: 86add4d3-b055-4633-b1c2-2a0b702d118a (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('4cf2f35e-4e97-4403-949b-c30eaa69dd9e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 01:35:42.176946', 'Sending mesaage to (+18477700637): Have a parenting question??? Just reply with 411 & add your question.');
INSERT INTO "events" VALUES('95b12644-13a0-40d8-8c1b-fb81debacf1f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 01:35:57.801377', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('38b1176c-67fe-40f7-988f-80f84d4648cb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 01:36:12.182285', 'Sending mesaage to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('1906181a-4318-4609-9d1f-b6c269ad0079', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 01:36:12.194340', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('a9c92be9-553f-4aae-bdc6-5e9381136526', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 01:36:42.349104', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('b0cc6b7a-2b30-431f-8256-7813b3ca07d1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 01:36:42.373453', 'Set ''Conversation Turn-Taking -- 1'' = ''1''.');
INSERT INTO "events" VALUES('474f4b75-48c7-4c98-b0dd-7c326669060d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 01:36:42.387779', 'Sending mesaage to (+18477700637): process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('9654d008-7a1b-4ba6-9358-490c0d1fe48b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 01:37:21.823131', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('8dbd92a8-ea29-4eeb-9418-d4976f33361b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 01:37:21.848727', 'Set ''Conversation Turn-Taking -- 2'' = ''1''.');
INSERT INTO "events" VALUES('99120725-6ba2-41f2-9a9b-e7ea82cc4a78', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 01:37:21.863123', 'Sending mesaage to (+18477700637): If baby only babbles, copy baby''s sounds. If baby can talk use the words baby knows how to say. Doing what baby can already do will keep him/her involved longer');
INSERT INTO "events" VALUES('30b156c5-0f80-413d-b30f-542c00f9d21f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 01:37:21.874270', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('429f8807-2df6-4ef0-be74-02e348b2f1de', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 02:12:42.197766', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('446c13c1-55db-4ffe-9541-57ef4cd3f1bc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:12:58.435373', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('df0858aa-bb13-447e-b19c-2bddf20fd623', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:12:58.446735', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('66fe9814-5913-4a02-bd11-ddf58273630e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:13:15.035742', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('800e6377-c05d-4a39-995e-eced2e435acf', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:13:15.058236', 'Set ''one'' = ''2''.');
INSERT INTO "events" VALUES('ac7cb1e6-4abd-4446-aafc-9865cb0242a1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:13:15.222925', 'Sending message to (+18477700637): Try again on Thursday & Friday when we send more tips & ideas.');
INSERT INTO "events" VALUES('038018b6-879a-4074-83ea-220be052ad00', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:13:15.234790', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('4d3aba4a-ec4f-40be-9aa9-0ba39d1ee719', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 02:15:59.164512', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('73002cb7-b627-4496-b385-2a3a73d9eba1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:16:16.423454', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('f16cec50-a12f-4443-bbe4-efdef5b7fb11', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:16:16.434310', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('95f2e1f2-ff22-4348-b170-6015c67f7007', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:16:30.809750', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('cf1ad220-2ff1-42a9-ae9f-f029b7b7aecd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:16:30.833763', 'Set ''one'' = ''1''.');
INSERT INTO "events" VALUES('e85bf742-b0f3-4801-a757-ed7d6da86c15', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:16:30.856469', 'Sending message to (+18477700637): Good job, u are baby''s first teacher? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('47982666-7da7-4848-b7bf-405b36ee5675', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:16:44.457354', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('1753c423-4e76-4a11-b2b4-3fe156c015fa', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:16:44.482473', 'Set ''two'' = ''2''.');
INSERT INTO "events" VALUES('8b330b16-c998-4925-b014-f0a6a848707d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:16:44.490553', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('fcb0fcbe-5b98-4a3b-85be-20e94059ad58', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 02:17:53.063175', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('46c66bb0-f16e-4c98-b30d-8bd981666948', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:18:04.671736', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('6380a66b-ef1e-4c01-9dce-adfa72fd894a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:18:04.682821', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('3aeb0aaf-8126-4010-abeb-cf685f2ebf43', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:18:23.333997', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('eaf18b3c-f61d-4084-9eba-2ddc82d9b561', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:18:23.357434', 'Set ''one'' = ''1''.');
INSERT INTO "events" VALUES('219caccb-603c-4762-ad35-67d5828dd684', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:18:23.381026', 'Sending message to (+18477700637): Good job, u are baby''s first teacher? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('eb5b67d7-917f-45c3-94d5-93209f370a60', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:18:58.874176', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('56278ece-8295-41cd-b18a-889ae56e3ffb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:18:58.897519', 'Set ''two'' = ''1''.');
INSERT INTO "events" VALUES('615760a5-4650-4a2e-9891-76180dbd743e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:18:58.907910', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('05d152e5-4df5-4fc2-8571-146c0dff5d5d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 02:20:36.140102', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('bd98a234-02cf-4cc7-87e0-015bb1cc8294', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:20:59.782289', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('34e054af-dff3-4b4c-9ca8-14e3fb8d2d4d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:20:59.794230', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('8c7a0fdd-3109-4aa4-9f2e-842a8d1f14c0', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:21:07.503130', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('45cef918-85cc-4e91-827e-a9caccfa3cbd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:21:07.526770', 'Set ''Motor Followup:question'' = ''1''.');
INSERT INTO "events" VALUES('3cea2937-9932-4378-9f5d-f30a99785829', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 02:30:31.932345', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('8d660972-974b-43a9-945a-b6c76fd0a455', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:30:58.194051', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('135e4fea-978f-4a2e-8e8d-1eafc8e80430', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:30:58.206395', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('408ff9ec-d282-4378-908c-7c382608f239', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 02:31:15.667618', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('79913f07-bb89-4c33-a83b-19dff17c0c11', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 02:31:15.694456', 'Set ''one'' = ''2''.');
INSERT INTO "events" VALUES('8ed93969-0485-4463-9544-697b6f3fb5bb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 02:31:15.720002', 'Sending message to (+18477700637): Try again on Thursday & Friday when we send more tips & ideas.');
INSERT INTO "events" VALUES('18a97150-3898-47f6-bef3-d9ff96e464dc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 02:31:15.731246', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('e018b477-5b1c-42bd-8ba2-e613412b8524', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-22 07:46:24.859278', 'Received [+12242206862]: 1');
INSERT INTO "events" VALUES('59db3bf7-5a50-40da-869e-fee1ed58d464', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-22 07:46:24.893265', 'Sending message to (+12242206862): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('5d258f11-7817-4cdd-892f-5506b6712bbf', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:07:01.111962', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('a508390f-0436-491e-a5f3-fe295ce7f58c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:07:06.687120', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('addc1e39-46cf-4f7d-b47d-c177987893f3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:07:06.699859', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('d8010337-8385-4197-805a-6ce81cbe894d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:07:18.155287', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('cc4f0408-51e5-49a8-be1d-85856b2f753a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:07:59.517871', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('9e856108-7296-421e-a7b0-501a610d95a3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:08:19.447675', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('a1e14d50-bee8-4a5e-8d04-e8a2d277824c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:08:19.460040', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('8d551e0f-51f4-438c-83dd-e090b716fd89', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:08:49.157607', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('7ab41f86-f2eb-49c8-a1fb-ccc81d8bbf31', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:08:49.183420', 'Set ''first_tip'' = ''1''.');
INSERT INTO "events" VALUES('45a11384-6db3-459e-b6e0-426b8f7fe669', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:08:49.197619', 'Sending message to (+18477700637): process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('16bc2680-adb0-41d6-9565-63617ff0881b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:10:48.858254', 'Scheduled message: 9a9723da-bbf9-4452-88a5-43d85c3dfca8 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('e65fec59-071d-4246-8bb0-c205675b7973', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:11:12.596760', 'Sending message to (+18477700637): Let''s help baby build the motor skills that are need to stack blocks when baby gets older. Give baby several blocks, books & rings of different REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('e3395244-e394-4182-a6f1-6905e6f87f68', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:11:12.608256', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('8ee5d55f-1a37-4bb9-938e-7c8e4d64241a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:11:35.862006', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('2ca51eae-c1fe-4f0e-84f5-56c7552fc4a9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:11:35.886931', 'Set ''first:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('a818efb1-ee43-4d84-a07d-1d0cef94533d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:11:35.901607', 'Sending message to (+18477700637): different sizes, shapes, & colors, & let baby explore them. Talk to baby about how the objects feel. Let baby squeeze the soft one & say soft, REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('9d8316c8-1b5f-4487-8f63-8c3e873d8016', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:12:03.640115', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('f3be1ea2-6429-4bc4-a039-fc6608d1d05c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:12:03.664872', 'Set ''second:second_tip'' = ''1''.');
INSERT INTO "events" VALUES('c68ba5c6-a43b-41e0-83c7-0521fb865793', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:12:03.679284', 'Sending message to (+18477700637): then let baby squeeze the hard one & say hard. Also show & say big & small. Show baby that they can bang together to make sounds & then let baby try.');
INSERT INTO "events" VALUES('070a6d13-6be2-4ecd-afcf-c3daab46ffd5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:12:03.691266', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('03a60737-f697-4a66-926d-4fcf7b25fb12', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:18:12.296783', 'Scheduled message: 9a9723da-bbf9-4452-88a5-43d85c3dfca8 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('f53cb0b3-23d0-4562-8ea5-8216646c81f3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:18:32.101401', 'Sending message to (+18477700637): Let''s help baby build the motor skills that are need to stack blocks when baby gets older. Give baby several blocks, books & rings of different REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('167c23c9-bd3d-4294-aabb-60bac1b0ca54', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:18:32.112439', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('1edac82f-d777-455f-992b-80b75d128d3d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:18:50.295105', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('3774988c-c455-4f3f-8a59-98115fb18f3d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:18:50.320191', 'Set ''first:Baby Motor:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('58991bbd-b4f3-4c4e-a922-3ab5563e24b3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:18:50.335096', 'Sending message to (+18477700637): different sizes, shapes, & colors, & let baby explore them. Talk to baby about how the objects feel. Let baby squeeze the soft one & say soft, REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('87220519-f5eb-4343-b60f-90855a53d0d8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:19:19.857057', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('91f27cfd-0856-4bda-a006-ab2f4964e125', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:19:19.880782', 'Set ''second:Baby Motor:second_tip'' = ''1''.');
INSERT INTO "events" VALUES('14e1f33f-c640-473a-b3c6-32e1d01bc27b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:19:19.896160', 'Sending message to (+18477700637): then let baby squeeze the hard one & say hard. Also show & say big & small. Show baby that they can bang together to make sounds & then let baby try.');
INSERT INTO "events" VALUES('3a8a8d99-dd8f-44f0-84f1-342e0edb6c98', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:19:19.906863', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('d4d70c74-fb0f-4032-b297-588394c25185', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:20:08.738159', 'Scheduled message: 9a9723da-bbf9-4452-88a5-43d85c3dfca8 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('ee1d5ecb-5b9a-448e-b3f5-1e5ec51072fb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:20:27.669375', 'Sending message to (+18477700637): Let''s help baby build the motor skills that are need to stack blocks when baby gets older. Give baby several blocks, books & rings of different REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('23b1ebba-ca82-41f9-a202-cadc69d91a97', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:20:27.682277', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('b4eb4556-c33b-4333-9ae5-e2b8e0239ab9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:20:59.981476', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('817a0a9f-6808-41b5-b8d9-ab3deb140db4', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:21:00.009314', 'Set ''Baby Motor:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('b9c751f8-d4d0-411b-b949-79fae54f453a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:21:00.023920', 'Sending message to (+18477700637): different sizes, shapes, & colors, & let baby explore them. Talk to baby about how the objects feel. Let baby squeeze the soft one & say soft, REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('84c00782-0edc-4914-a12a-06aa1591dbc5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:22:02.755385', 'Received [+18477700637]: 3');
INSERT INTO "events" VALUES('52e6ddb5-3f72-4caa-ac68-b582e1465896', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:22:02.779262', 'Set ''Baby Motor:second_tip'' = ''3''.');
INSERT INTO "events" VALUES('ef51bbf2-a226-42db-9400-70c9f33061ba', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:22:02.795265', 'Sending message to (+18477700637): then let baby squeeze the hard one & say hard. Also show & say big & small. Show baby that they can bang together to make sounds & then let baby try.');
INSERT INTO "events" VALUES('234ac4d3-2745-4ca0-8867-7340dd7cf235', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:22:02.806289', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('db48e963-3947-4e64-8432-131b2511eb98', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:24:06.799463', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('930e22d7-5f6c-40d2-9935-72f3f6edc25d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:24:19.206475', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('f559ea70-0302-478c-a512-888bbb704cb3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:24:19.217169', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('804ade36-fefd-4913-9eb9-454644579b11', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:24:31.988305', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('b6b5ba98-117a-4a16-8378-6e8c823732d5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:25:03.762994', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('7f56cd76-dc33-473c-866e-9c8e1b54f487', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:25:11.966499', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('175ac2a0-d05c-4d6c-8951-e961e9ef93d7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:25:11.977881', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('90162622-4776-41f6-9ffc-d679b968a9f9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:26:48.356577', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('42dd05fc-2512-4d8a-84d5-da507ee8d064', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:26:48.382399', 'Set ''Conversation Turn-Taking:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('00b10c0b-b5ce-4d4e-a676-7d721fbd508d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:26:48.396195', 'Sending message to (+18477700637): process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('456368cc-0902-40db-9348-8c63715f362f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:27:02.454995', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('a99195a7-469e-4a76-8418-746464602b04', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:27:02.478061', 'Set ''Conversation Turn-Taking:second_tip'' = ''2''.');
INSERT INTO "events" VALUES('d25f4e73-36bd-4ef7-867c-db7c29dd6452', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:27:02.491535', 'Sending message to (+18477700637): If baby only babbles, copy baby''s sounds. If baby can talk use the words baby knows how to say. Doing what baby can already do will keep him/her involved longer');
INSERT INTO "events" VALUES('a8596a01-a2dd-4a2f-8996-f72a3417b84a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:27:02.502170', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('b7d5cf4a-0264-429c-9e9a-2942b636e87d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:29:10.259633', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('7378347c-c2b9-443e-997f-83f78cc6d514', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:29:27.518822', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('02e31934-4cd4-4505-a909-fb6813cd9e7e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:29:27.530258', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('4f6bfebc-9d80-4ad5-81c6-61f0f5c608f6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:33:06.082642', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('955f834c-0b3c-409f-98c7-d061316c04ab', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:33:06.106483', 'Set ''Conversation Turn-Taking:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('9eab1244-abcd-4a41-803f-f2f8eb9221b1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:33:06.123546', 'Sending message to (+18477700637): process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('836f5dc3-c6c4-4d68-bf16-05640e897482', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:35:37.549902', 'Scheduled message: 47da0ab1-ace6-4add-a627-50c94a034877 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('c366b03e-1169-43eb-b32c-70414a5247f9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:36:01.886355', 'Sending message to (+18477700637): Conversation turn taking is learned by doing, even if baby is only babbling. When babbling with baby pause to allow baby time to process  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('e5e1b4ab-9f7f-463d-9c35-d4a0cfc617ef', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:36:01.897995', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('d2f1d4e2-ad4d-4a9f-90e3-1d880ec610e6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:36:21.346080', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('94fd31ae-2554-40c8-aa02-ede8499f28b0', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:36:21.365697', 'Sending message to (+18477700637): I don''t understand ''2''. Can you say it another way, perhaps?');
INSERT INTO "events" VALUES('cfc516e4-b859-44e7-9345-538e6d3c4850', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:37:22.063506', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('f3cf77cb-72ca-4c67-bbb7-5814eb329411', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:37:22.092097', 'Set ''Conversation Turn-Taking:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('7419441e-2ef1-4925-9b78-60d69d1ab5c3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:37:22.107197', 'Sending message to (+18477700637): process each message This way of speaking to ur baby as if ur having a conversation with ur baby develops their brain.  REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('5c436986-0335-4c18-b355-c83d7fba6b52', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:37:42.385259', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('1a52057f-7218-44bd-aba8-9e02f4e3cf3e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:37:42.409995', 'Set ''Conversation Turn-Taking:second_tip'' = ''1''.');
INSERT INTO "events" VALUES('c662338a-d1a8-413f-9bc4-8b6d02c6c76d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:37:42.425529', 'Sending message to (+18477700637): If baby only babbles, copy baby''s sounds. If baby can talk use the words baby knows how to say. Doing what baby can already do will keep him/her involved longer');
INSERT INTO "events" VALUES('15973961-1128-41e5-b548-1769a10f509b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:37:42.436663', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('a7f83420-bd8d-4fbb-9768-4f99549cbdef', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:39:52.269001', 'Scheduled message: 0bb2c8f0-979d-4a92-bb30-aa2b6ebcd1b2 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('344b6654-57f5-44b8-844f-3d89b30c27b1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:40:06.824078', 'Sending message to (+18477700637): Let''s do some imagination building. Read a book aloud to baby today. Try using a different voice & facial expression for each character REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('26cfbd94-9324-45e4-962c-b5905150deed', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:40:06.836133', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('da336256-c7e4-4fd3-a74c-9b6892ae1ae7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:40:22.874807', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('262e15d3-232a-4888-b9ee-80708ca9f63d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:40:22.922933', 'Set '''' = ''1''.');
INSERT INTO "events" VALUES('3c4fe4c7-8320-44bd-9b67-fa1b701b0779', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:40:22.940727', 'Sending message to (+18477700637): For more fun put a sock on ur hand & have sock puppet do the talking. This will keep baby interested in the story, & build baby''s thinking & imagination.');
INSERT INTO "events" VALUES('d46f6ca4-5a08-4e0e-84e0-1269d448d7f6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:40:22.951747', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('78eb92a6-e5bd-4d80-9b84-0f9dd5a29e58', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:41:15.149435', 'Scheduled message: 0bb2c8f0-979d-4a92-bb30-aa2b6ebcd1b2 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('521b63a9-e88e-4df1-8447-ff6e09a58728', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:41:36.820504', 'Sending message to (+18477700637): Let''s do some imagination building. Read a book aloud to baby today. Try using a different voice & facial expression for each character REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('051411a3-be4a-437b-989c-c5daccf0d10d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:41:36.832461', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('5ef0b063-da63-4c7d-8ded-a82c5004bdea', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:42:38.909104', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('4ff82f5a-9ddf-4d27-ac98-84370cc9ecc7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:42:38.935585', 'Set ''Behavior:prompt'' = ''1''.');
INSERT INTO "events" VALUES('ed2fcc5a-82da-464c-a02b-6eff0d1ef067', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:42:38.950166', 'Sending message to (+18477700637): For more fun put a sock on ur hand & have sock puppet do the talking. This will keep baby interested in the story, & build baby''s thinking & imagination.');
INSERT INTO "events" VALUES('9a1007cb-1240-420a-a626-7c57064fa3b1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:42:38.962021', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('bfaefb8f-c822-418d-a719-9fd804c8ec84', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:44:13.517676', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('d6e967e6-1ff3-48f7-8f58-681cdb930596', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:44:33.549859', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('fd847e0b-bf22-45e8-a825-d900318be187', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:44:33.561757', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('942f00fb-3040-4cbd-bd8c-64122a3b4030', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:44:57.460085', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('7bfaad8e-7440-446e-8a07-e859efe4c7b5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:44:57.501935', 'Set ''Motor Followup:first_question'' = ''1''.');
INSERT INTO "events" VALUES('21113528-ea00-4e20-af01-6ebd6cb9d825', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:44:57.533976', 'Sending message to (+18477700637): Good job, u are baby''s first teacher? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('d3c247a7-c4aa-4efd-be05-50fd953f24d2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:45:30.088605', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('68572884-5570-415e-b0be-df5649505a73', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:45:30.112963', 'Set ''Motor Followup:second_question'' = ''1''.');
INSERT INTO "events" VALUES('36872cb7-fe5b-4917-9d1a-43f8a498a5f9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:45:30.121254', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('043bcab5-cbc9-4467-8bcb-704efe805a03', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:45:38.379647', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('e0060270-cffa-4fc5-8438-bae87023a976', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:46:03.545182', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('1963d6c9-6247-4db9-8973-1e17583cd41b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:46:03.556830', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('dccbf834-1ffc-47f8-8ca5-ce25b3878ede', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:46:21.419149', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('35d0088b-daaf-4486-b7f3-85562a60f264', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:46:21.443805', 'Set ''Motor Followup:first_question'' = ''1''.');
INSERT INTO "events" VALUES('d28184bb-9ce5-4599-8f50-3e506a6eb8c7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:46:21.463896', 'Sending message to (+18477700637): Good job, u are baby''s first teacher? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('0b13bc02-2e72-43c6-b19a-273d5f23b54c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:46:53.543141', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('a4a86094-d914-41ef-b945-e28b1ce45a11', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:46:53.567298', 'Set ''Motor Followup:second_question'' = ''2''.');
INSERT INTO "events" VALUES('32242c72-00bb-4e64-b3aa-fbfaf2224e22', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:46:53.575312', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('77ae7a4f-5088-4894-9d61-b0092ca0ab9b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:47:38.073833', 'Received [+18477700637]: thanks');
INSERT INTO "events" VALUES('864315bf-de92-41a5-9fac-46b34a8c36aa', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:47:38.088474', 'Sending message to (+18477700637): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('8350e98e-9ad4-4efd-a6eb-b4915510684c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:48:04.851761', 'Received [+18477700637]: 411 thanks');
INSERT INTO "events" VALUES('4421f993-b30f-4922-b745-3fc2fd337d17', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.861290', 'Sent 411 response to (+18477700637).');
INSERT INTO "events" VALUES('2290e50a-ff17-4727-a88e-f38b7345e439', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.890557', 'Sending message to ((847) 770-0637): Incoming 411 from +18477700637:');
INSERT INTO "events" VALUES('dff8523d-4fe3-455d-9d60-e9588c9a4b3e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.907102', 'Sending message to ((847) 770-0637): 411 thanks');
INSERT INTO "events" VALUES('f65284b0-9d03-4f32-a23c-944c9deb14fa', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.917780', 'Forwarded 411 message from (+18477700637): 411 thanks');
INSERT INTO "events" VALUES('4dd13846-5249-499f-a097-e39e0af7200e', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-22 08:48:04.940487', 'Sending message to ((312) 339-6771): Incoming 411 from +18477700637:');
INSERT INTO "events" VALUES('ee2c2c06-3e50-4d0a-b2ed-98acf00afedd', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-22 08:48:04.957279', 'Sending message to ((312) 339-6771): 411 thanks');
INSERT INTO "events" VALUES('42f8f9c8-2b59-48a0-84e1-182ec6c0fd31', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.968894', 'Forwarded 411 message from (+18477700637): 411 thanks');
INSERT INTO "events" VALUES('bd246d31-e74d-486e-9084-48b024e1a843', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:48:04.982468', 'Sending message to (+18477700637): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('d021bb82-3e5f-4e8f-9e62-aea83c1089cd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 08:50:02.766942', 'Scheduled message: daa3e6cd-916f-4baf-83b0-6a99ebb866e1 (Unknown) for 2010-09-22 00:00:00.');
INSERT INTO "events" VALUES('92894be7-7271-421c-8be6-9c71f25bda09', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:50:03.544808', 'Sending message to (+18477700637): Did u & baby play with blocks, books, & rings today? REPLY 1 FOR YES; REPLY 2 FOR NO.');
INSERT INTO "events" VALUES('af6c20b4-b58f-4c05-ac20-ed0b18ae36b5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:50:03.556074', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('e81b14d2-95cb-47b0-825e-3e07bca1e00a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-22 08:50:21.394110', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('c87ea6a4-6191-44f4-a96d-711fcf6769a9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-22 08:50:21.421729', 'Set ''Motor Followup:first_question'' = ''2''.');
INSERT INTO "events" VALUES('b28e72aa-06ed-4d95-b32e-4e45f40897f2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 08:50:21.441782', 'Sending message to (+18477700637): Try again on Thursday & Friday when we send more tips & ideas.');
INSERT INTO "events" VALUES('54fcae25-55d7-45d0-8041-20d769f955bb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 08:50:21.453672', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('1fbd86a3-8c48-4177-9343-9ca44b40eafc', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-22 12:53:48.065938', 'Received [+18474092757]: 1');
INSERT INTO "events" VALUES('fc2aa294-8817-4a63-8ac1-66e320f127f9', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-22 12:53:48.084482', 'Sending message to (+18474092757): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('69b66d76-df90-4dd8-9f0b-cb401c773c14', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-22 13:07:00.920116', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:10:00.');
INSERT INTO "events" VALUES('eb1490f6-b7fd-47ef-bf6b-3f6352ec1a6f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'schedule', '2010-09-22 13:07:00.969100', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:12:00.');
INSERT INTO "events" VALUES('fe3e7151-4c86-438d-b281-42db1fa63e07', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'schedule', '2010-09-22 13:07:01.050992', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:14:00.');
INSERT INTO "events" VALUES('ac9ccdcd-2aae-4a82-8624-4f110f92277b', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'schedule', '2010-09-22 13:07:01.099449', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:16:00.');
INSERT INTO "events" VALUES('b7dec80e-bc74-4b05-bc3a-434e3cbc5a8e', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'schedule', '2010-09-22 13:07:01.161250', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:18:00.');
INSERT INTO "events" VALUES('81d9f596-6dca-434f-9f61-13b60a03a3e7', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'schedule', '2010-09-22 13:07:01.207063', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:20:00.');
INSERT INTO "events" VALUES('0f3ed910-f85b-4b55-b64f-1859b366cb8b', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'schedule', '2010-09-22 13:07:01.293545', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:22:00.');
INSERT INTO "events" VALUES('93d93353-fba5-4cb6-8622-b1d4d2c15390', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'schedule', '2010-09-22 13:07:01.340234', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:24:00.');
INSERT INTO "events" VALUES('456472ed-8aa9-4600-9840-b28ab463f4f5', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'schedule', '2010-09-22 13:07:01.385676', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:26:00.');
INSERT INTO "events" VALUES('c70e1fe7-a77b-4e88-bd0d-08ff7da9626e', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'schedule', '2010-09-22 13:07:01.452000', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:28:00.');
INSERT INTO "events" VALUES('6a38acd9-a016-4361-a618-3f90fccbccfb', 'ae5916c0-df49-4902-966c-747817c517e5', 'schedule', '2010-09-22 13:07:01.498473', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:30:00.');
INSERT INTO "events" VALUES('6e22cb9e-f845-4549-ad27-0fbae47f6d9a', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'schedule', '2010-09-22 13:07:01.543797', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:32:00.');
INSERT INTO "events" VALUES('a23434a3-7ac2-43b9-b4f4-d805c1e983ba', '74287e79-e01c-4170-ac84-94b265775cf3', 'schedule', '2010-09-22 13:07:01.593069', 'Scheduled message: b2417b58-222a-443f-a118-2d18294d66b3 (Unknown) for 2010-09-22 19:34:00.');
INSERT INTO "events" VALUES('03b45917-478d-46c8-a157-a0ef14399639', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-22 17:17:16.303055', 'Received [+13123396771]: 1');
INSERT INTO "events" VALUES('b36e470c-e105-4a21-a3fb-0db92c23cf47', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-22 17:17:16.369485', 'Sending message to (+13123396771): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('278487cf-b148-449c-b2ab-11dc8f10ee4e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-22 19:10:01.914457', 'Sending message to (+18477700637): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('59eeded4-9caf-427e-9698-39f6a4a9a925', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-22 19:10:01.925988', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('f1511f7e-25b7-4042-8fc7-391b3350a2c7', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-22 19:12:01.901494', 'Sending message to (+18474092757): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('328f455d-cb27-4a6c-acf9-456c224581b3', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'dialog', '2010-09-22 19:12:01.913937', 'Started new dialog (Unknown Dialog) for (+18474092757).');
INSERT INTO "events" VALUES('a96b31b9-cb35-4cfe-9b55-5c2b7cc9b112', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'send', '2010-09-22 19:14:01.898249', 'Sending message to (+18477307314): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('b4a7ace3-5981-4ed8-aac9-2b7c6f2b7388', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'dialog', '2010-09-22 19:14:01.909880', 'Started new dialog (Unknown Dialog) for (+18477307314).');
INSERT INTO "events" VALUES('f68f6967-2e38-4ceb-a7a2-1bfcb7f2ec8b', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'send', '2010-09-22 19:16:01.898521', 'Sending message to (+18475331729): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('6e45b980-b511-40c9-b535-104c45171432', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'dialog', '2010-09-22 19:16:01.910470', 'Started new dialog (Unknown Dialog) for (+18475331729).');
INSERT INTO "events" VALUES('31ac4380-474b-4d1d-8d67-5440b743fc16', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-22 19:18:01.902211', 'Sending message to (+12242206684): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('2bc7eda9-e266-42cf-b29a-f10c0519a351', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'dialog', '2010-09-22 19:18:01.913796', 'Started new dialog (Unknown Dialog) for (+12242206684).');
INSERT INTO "events" VALUES('78199218-9739-4c63-8650-35793137471b', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'receive', '2010-09-22 19:19:42.844179', 'Received [+12242206684]: 1');
INSERT INTO "events" VALUES('7ae0cb80-bd06-4f37-9cba-4729b4a693ea', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'variable', '2010-09-22 19:19:42.963534', 'Set ''Bath Talk:prompt'' = ''1''.');
INSERT INTO "events" VALUES('ea6ba1ad-fdb2-4c07-9792-ccd9c123128e', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-22 19:19:42.977654', 'Sending message to (+12242206684): Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
INSERT INTO "events" VALUES('9ad0dd07-6070-485d-a40c-6fc1615c20e6', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'dialog', '2010-09-22 19:19:42.988527', 'Finished dialog for (+12242206684).');
INSERT INTO "events" VALUES('182e6336-8ad1-491c-bba4-84b9af571131', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-22 19:20:01.902703', 'Sending message to (+18475303742): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('c1421b65-ec7f-4fe9-9a11-342a3cfb981e', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'dialog', '2010-09-22 19:20:01.915172', 'Started new dialog (Unknown Dialog) for (+18475303742).');
INSERT INTO "events" VALUES('117c40b5-8f3d-470e-bdcd-9312bc7e81d6', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-22 19:22:01.899239', 'Sending message to (+12242206679): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('92b55570-6e9a-4372-835f-425fb2816f24', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'dialog', '2010-09-22 19:22:01.911044', 'Started new dialog (Unknown Dialog) for (+12242206679).');
INSERT INTO "events" VALUES('e592597e-d810-4738-a108-7dabcd19c2fe', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-22 19:24:01.902349', 'Sending message to (+17733199759): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('c9ed2105-9335-45c7-aada-7526a61ebd3e', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'dialog', '2010-09-22 19:24:01.924338', 'Started new dialog (Unknown Dialog) for (+17733199759).');
INSERT INTO "events" VALUES('b2adb2c4-6cbb-494d-8fc7-eb46bb0f57bf', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'send', '2010-09-22 19:26:01.899593', 'Sending message to (+19547016889): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('e1de2e2d-9901-453a-93b5-890d8be57003', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'dialog', '2010-09-22 19:26:01.911412', 'Started new dialog (Unknown Dialog) for (+19547016889).');
INSERT INTO "events" VALUES('a3bdacd1-567c-4c4d-a22e-52fce2153c67', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'send', '2010-09-22 19:28:01.899406', 'Sending message to (+18476301104): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('1b4ee9f0-d714-4dc4-846c-40c762867be4', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'dialog', '2010-09-22 19:28:01.911797', 'Started new dialog (Unknown Dialog) for (+18476301104).');
INSERT INTO "events" VALUES('ebd9ecf4-55c1-4753-b96e-22147527ad12', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-22 19:30:01.900057', 'Sending message to (+17739608723): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('8ab4fc1a-1738-42f6-b148-8761b0c2f6e2', 'ae5916c0-df49-4902-966c-747817c517e5', 'dialog', '2010-09-22 19:30:01.911061', 'Started new dialog (Unknown Dialog) for (+17739608723).');
INSERT INTO "events" VALUES('cce78a9c-0c40-445e-ad2f-faab551caf32', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'receive', '2010-09-22 19:30:38.250621', 'Received [+19547016889]: 1');
INSERT INTO "events" VALUES('8ad127ee-84ad-4704-89db-7fbadffd556d', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'variable', '2010-09-22 19:30:38.277691', 'Set ''Bath Talk:prompt'' = ''1''.');
INSERT INTO "events" VALUES('87f59c53-52cd-4883-bf5a-ad82d8a569c8', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'send', '2010-09-22 19:30:38.292639', 'Sending message to (+19547016889): Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
INSERT INTO "events" VALUES('bd3575ca-079b-46dd-b743-ccd90beadde7', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'dialog', '2010-09-22 19:30:38.305031', 'Finished dialog for (+19547016889).');
INSERT INTO "events" VALUES('ca7be2c3-b82d-493c-a6aa-f9522b5bf7a4', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-22 19:32:01.900027', 'Sending message to (+13123396771): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('e7c97223-4ada-4932-a559-7eb6bc5a28b1', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'dialog', '2010-09-22 19:32:01.912085', 'Started new dialog (Unknown Dialog) for (+13123396771).');
INSERT INTO "events" VALUES('f27bb73d-3d3d-4bfa-8efd-c7b38c63c8c6', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-22 19:34:01.900283', 'Sending message to (+12242206862): At bath time practice conversation turn taking. During bath ur baby can''t be left alone for even 1 second so have a conversation with ur baby. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('3dfcbfc3-aaba-43eb-9e76-05547c09426f', '74287e79-e01c-4170-ac84-94b265775cf3', 'dialog', '2010-09-22 19:34:01.911803', 'Started new dialog (Unknown Dialog) for (+12242206862).');
INSERT INTO "events" VALUES('16c3cf59-aedd-483d-8d3b-ec815e411f28', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'receive', '2010-09-22 19:46:35.811778', 'Received [+18476301104]: 1');
INSERT INTO "events" VALUES('55f57cac-e0d4-4435-adfa-aa307eaf6969', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'variable', '2010-09-22 19:46:35.838894', 'Set ''Bath Talk:prompt'' = ''1''.');
INSERT INTO "events" VALUES('1810583a-5ee0-4fe6-a4f8-89e3588492fa', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'send', '2010-09-22 19:46:35.853226', 'Sending message to (+18476301104): Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
INSERT INTO "events" VALUES('0c785fea-38c9-4fa9-b522-2bc42a232103', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'dialog', '2010-09-22 19:46:35.865126', 'Finished dialog for (+18476301104).');
INSERT INTO "events" VALUES('9ddba798-3941-426a-b04b-b8a22453728e', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'receive', '2010-09-22 19:52:34.588569', 'Received [+18476301104]: 1');
INSERT INTO "events" VALUES('c481b4b1-5e42-4b2d-8a63-4640a8cf1af7', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'send', '2010-09-22 19:52:34.605774', 'Sending message to (+18476301104): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('b6226818-c247-4b3d-8b13-56c48fd33b73', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-22 21:26:21.510042', 'Received [+17733199759]: 1');
INSERT INTO "events" VALUES('d1ed5332-c70b-4a95-86e5-03607675f3af', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-22 21:26:21.534912', 'Set ''Bath Talk:prompt'' = ''1''.');
INSERT INTO "events" VALUES('c7f171cd-a362-4dc0-be8d-42def2cf54db', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-22 21:26:21.549566', 'Sending message to (+17733199759): Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
INSERT INTO "events" VALUES('c3622e02-dea7-462c-95b4-5edc37cedfb5', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'dialog', '2010-09-22 21:26:21.561293', 'Finished dialog for (+17733199759).');
INSERT INTO "events" VALUES('9357663f-5d8d-41bd-816d-39b7b2bd5828', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 06:40:54.660432', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('3040ac64-c74c-48ea-bd1e-858adf57e4a7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 06:40:54.748963', 'Set ''Bath Talk:prompt'' = ''1''.');
INSERT INTO "events" VALUES('f11453a1-8ee6-4bf7-ace2-d1a726f1607e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 06:40:54.788845', 'Sending message to (+18477700637): Look baby in the eye & talk about what baby is doing, splashing water, holding soap, warmth of the water. Give baby many turns to respond in the conversation.');
INSERT INTO "events" VALUES('788b7c4a-53b4-4659-b895-e3e2b0cba655', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 06:40:54.800063', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('ef081418-b032-47de-966f-e4130f8f082e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 07:44:25.238152', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('37404196-4832-44d1-b208-95a5f620c378', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 07:45:33.420852', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('04c1fd13-0b91-43df-b601-8730a884b3cd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 07:47:19.846532', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('f742894f-4d51-48a7-8bb5-e98f79587487', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 07:49:20.029049', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('335082a1-1104-4bcf-a8e9-985474fae1bc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 07:57:51.007206', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('efdb52dc-bc49-4b38-9589-f9d2a2a716e9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 08:00:20.910310', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 00:00:00.');
INSERT INTO "events" VALUES('a5666c75-f4c9-43a6-93dd-9652c1b7ae08', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:00:23.297961', 'Sending message to (+18477700637): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('c8ec6139-5505-458d-9af7-efbebe498aca', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 08:00:23.316528', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('aa650526-d020-41fb-8ead-7ec54658af1c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:00:52.074479', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('16340acc-6269-4b13-8a22-e83ec4004b24', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:00:52.102877', 'Set ''ready'' = ''1''.');
INSERT INTO "events" VALUES('81dee057-90c5-44bc-936e-fe0a99ae3c76', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:00:52.117117', 'Sending message to (+18477700637): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('3c599db8-affa-4a69-97f5-602157b31b16', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:01:05.083640', 'Received [+18477700637]: 40');
INSERT INTO "events" VALUES('87c508a9-2e8e-4bf3-b42c-64a7f6819e4f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:01:05.099622', 'Sending message to (+18477700637): I don''t understand ''40''. Can you say it another way, perhaps?');
INSERT INTO "events" VALUES('9a4d27dc-100c-4060-aeea-75d861c1bb55', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:01:18.939278', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('9b879fd8-d5f7-473a-b8c4-83115fdde050', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:01:18.962563', 'Set ''continue'' = ''1''.');
INSERT INTO "events" VALUES('4af0e644-8be0-40fa-9d07-ec490b55eb3c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:01:18.976671', 'Sending message to (+18477700637): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('2fe117e8-31c3-4731-b3d2-d1cfba3f7ba1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:01:18.996098', 'Sending message to (+18477700637): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('f313a8e6-4faa-43ff-b83a-35e5d0f7fb34', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:01:32.001861', 'Received [+18477700637]: 9');
INSERT INTO "events" VALUES('bd7252a2-5997-4d96-a8cf-4b41e5bae9a7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:01:32.018692', 'Sending message to (+18477700637): I don''t understand ''9''. Can you say it another way, perhaps?');
INSERT INTO "events" VALUES('25af4cfd-7be5-4b88-b28a-c61772d1f213', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:02:05.711085', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('4696e66c-ee70-481d-b220-51b43ec98492', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:02:05.738281', 'Set ''blame'' = ''1''.');
INSERT INTO "events" VALUES('8e247cf3-f0df-4c89-b418-1dc895836a57', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:02:05.752820', 'Sending message to (+18477700637): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('90351c24-fecd-4854-b5fe-ae995ef21f04', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:02:19.192553', 'Received [+18477700637]: 4');
INSERT INTO "events" VALUES('ce54e6cc-7025-408e-bbbd-18ffba74561d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:02:19.220466', 'Set ''anxious'' = ''4''.');
INSERT INTO "events" VALUES('304a7145-2b9e-4561-8e59-ff1cbec3321a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:02:19.235226', 'Sending message to (+18477700637): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('c5c4a2f9-ac11-4f12-a376-0e1bf36f8f56', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:02:50.072670', 'Received [+18477700637]: 3');
INSERT INTO "events" VALUES('6070948a-9b42-47e4-95d3-945996c95956', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:02:50.098547', 'Set ''afraid'' = ''3''.');
INSERT INTO "events" VALUES('e5ae5492-ede9-4ef5-96cf-760f65eea401', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:02:50.115504', 'Sending message to (+18477700637): Thank you for completing this survey!');
INSERT INTO "events" VALUES('b971d793-07a4-44f2-a48d-be40ff6c6eab', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 08:02:50.127703', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('ad8a4ebd-477c-448e-bd3b-151d8853a970', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 08:13:17.778005', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 08:15:00.');
INSERT INTO "events" VALUES('5e06160a-2eb2-4346-afd7-b154aa197d77', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:15:23.255705', 'Sending message to (+18477700637): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('d5aab9e7-8917-4e65-9e4f-d0d393d85473', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 08:15:23.266783', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('92ef3dec-2b34-4599-9ae2-316df214d169', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:17:05.419977', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('f82a46b6-ff16-4e6c-9868-34d204d091ba', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:17:05.444358', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('2a8681d5-f93f-4c14-a68e-54e64b17469e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:17:05.458532', 'Sending message to (+18477700637): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('33e1a10b-0605-4fe7-986e-ab3dafc6d17f', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-23 08:17:17.473931', 'Received [+12242206862]: 1');
INSERT INTO "events" VALUES('06af95ff-6a8b-4205-9f1d-c7903c1b137a', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 08:17:17.489520', 'Sending message to (+12242206862): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('7bec3d02-ce71-4d5e-9ed7-733656cde0b1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:17:26.653622', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('8c70c1d1-76d7-412d-a9af-9b8282e57b6a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:17:26.678125', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('249d8aa3-2977-4bee-ad05-fb4b14eda5cd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:17:26.692728', 'Sending message to (+18477700637): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('716d9888-eb7a-49f9-b245-daf4c275d69f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:17:26.711384', 'Sending message to (+18477700637): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('4aaa9206-52ec-4724-b1da-bc0f0e94c86e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:17:52.187130', 'Received [+18477700637]: 3');
INSERT INTO "events" VALUES('0026f6b2-e76d-4762-93ff-4e1bf7e6f176', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:17:52.210912', 'Set ''epnds:blame'' = ''3''.');
INSERT INTO "events" VALUES('c61535f5-12e7-4771-8a0d-4410b6a2d294', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:17:52.225257', 'Sending message to (+18477700637): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('5c6a815a-9e6e-465a-93a7-4cca5461e504', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:18:05.787676', 'Received [+18477700637]: 2');
INSERT INTO "events" VALUES('42236ab7-fbd6-467a-9769-0b981d755851', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:18:05.812172', 'Set ''epnds:anxious'' = ''2''.');
INSERT INTO "events" VALUES('9936fbdc-ac42-493d-a86d-17f7f1cffc16', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:18:05.829419', 'Sending message to (+18477700637): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('009874d5-57ec-4fe4-8949-d5030361a28b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 08:18:20.285280', 'Received [+18477700637]: 4');
INSERT INTO "events" VALUES('12658251-85b7-4ca9-8bf5-a34701c02edf', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 08:18:20.309537', 'Set ''epnds:afraid'' = ''4''.');
INSERT INTO "events" VALUES('abc9a655-88c2-4831-b556-f0872a3d3437', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 08:18:20.324640', 'Sending message to (+18477700637): Thank you for completing this survey!');
INSERT INTO "events" VALUES('950b4855-607b-4524-a993-e519d1251de3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 08:18:20.335840', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('9fab1398-5b56-4356-bfeb-5de2f6ded338', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-23 08:41:12.610392', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:30:00.');
INSERT INTO "events" VALUES('b4cfb66c-1699-4bb2-9aa0-071bd35a9f10', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'schedule', '2010-09-23 08:41:12.652884', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:32:00.');
INSERT INTO "events" VALUES('8998ed7a-8d4e-4b4e-9474-2ca1a788b31b', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'schedule', '2010-09-23 08:41:12.695481', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:34:00.');
INSERT INTO "events" VALUES('a812d1e7-aec7-4494-a410-9967d5a19497', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'schedule', '2010-09-23 08:41:12.740515', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:36:00.');
INSERT INTO "events" VALUES('d934649f-5331-4a59-ac79-7c248157f8c1', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'schedule', '2010-09-23 08:41:12.782552', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:38:00.');
INSERT INTO "events" VALUES('39a03718-e558-46d6-a11c-b50f44b16ec2', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'schedule', '2010-09-23 08:41:12.823909', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:40:00.');
INSERT INTO "events" VALUES('3b3407d3-5af3-4fb4-a85c-d3a0d15401d1', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'schedule', '2010-09-23 08:41:12.866219', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:42:00.');
INSERT INTO "events" VALUES('913ae718-4fe9-4759-b9b7-2b6acb3ef789', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'schedule', '2010-09-23 08:41:12.906896', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:44:00.');
INSERT INTO "events" VALUES('f7b6c4cc-59c4-43e6-9682-c74b88848f3f', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'schedule', '2010-09-23 08:41:12.953137', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:46:00.');
INSERT INTO "events" VALUES('acacedad-a9e6-4cfc-9b17-989930e99ed7', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'schedule', '2010-09-23 08:41:12.995484', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:48:00.');
INSERT INTO "events" VALUES('c627252c-18ed-4667-b31c-03d78cf53633', 'ae5916c0-df49-4902-966c-747817c517e5', 'schedule', '2010-09-23 08:41:13.040595', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:50:00.');
INSERT INTO "events" VALUES('b4cafe72-2747-43c8-aeda-d915649de5e8', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'schedule', '2010-09-23 08:41:13.082188', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:52:00.');
INSERT INTO "events" VALUES('4ffa7e11-e108-42ec-9dff-08b51eb9b34f', '74287e79-e01c-4170-ac84-94b265775cf3', 'schedule', '2010-09-23 08:41:13.126397', 'Scheduled message: a5a5db94-7ab5-4be8-85a0-83368d76f428 (Unknown) for 2010-09-23 10:54:00.');
INSERT INTO "events" VALUES('0c23afa1-b50e-4f9a-a166-eb09de3383f0', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'receive', '2010-09-23 09:17:17.405237', 'Received [+12242206679]: 1');
INSERT INTO "events" VALUES('4a449ed8-cdde-480b-80a4-149ff56aa6e4', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 09:17:17.424043', 'Sending message to (+12242206679): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('7292ff9b-3ec7-4ae7-89fd-7cc303ffffed', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'receive', '2010-09-23 09:18:40.501743', 'Received [+12242206679]: 411');
INSERT INTO "events" VALUES('d9d7581f-15e5-4d0c-8eb5-0e7734b0b4bc', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 09:18:40.513214', 'Sent 411 response to (+12242206679).');
INSERT INTO "events" VALUES('9480b5d1-1a74-439c-b4f3-9c5f1c755357', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 09:18:40.539849', 'Sending message to ((847) 770-0637): Incoming 411 from +12242206679:');
INSERT INTO "events" VALUES('ba9e55e6-b221-41fc-bb22-6ace72963942', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 09:18:40.556558', 'Sending message to ((847) 770-0637): 411');
INSERT INTO "events" VALUES('42f3222d-8717-4b5f-9b8f-7c63d86b680f', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 09:18:40.568607', 'Forwarded 411 message from (+12242206679): 411');
INSERT INTO "events" VALUES('fc9c18a3-c4c3-46a5-9624-922213312201', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 09:18:40.593687', 'Sending message to ((312) 339-6771): Incoming 411 from +12242206679:');
INSERT INTO "events" VALUES('2ef316e0-4dc1-453d-a952-07238803eab3', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 09:18:40.610652', 'Sending message to ((312) 339-6771): 411');
INSERT INTO "events" VALUES('33c751b1-56fe-4c6c-99c1-ae0cc3c1785e', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 09:18:40.622179', 'Forwarded 411 message from (+12242206679): 411');
INSERT INTO "events" VALUES('0d995b44-70ae-4290-9afb-c42721a54835', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 09:18:40.636261', 'Sending message to (+12242206679): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('cb32cb7a-a98e-449c-9437-3b337540cfa2', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'receive', '2010-09-23 09:35:53.575691', 'Received [+18475303742]: 1');
INSERT INTO "events" VALUES('6c2c7921-371d-4530-b962-2292569d5142', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-23 09:35:53.591417', 'Sending message to (+18475303742): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('26f23566-60ed-4acc-8248-8f0b62359ba3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:30:05.208503', 'Sending message to (+18477700637): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('c4d4a455-3837-4cdc-b5d2-595396a2e6d4', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 10:30:05.220294', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('fc05d96d-8ebf-4363-83d5-17d52853bb33', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 10:32:05.205664', 'Sending message to (+18474092757): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('a0ad4d10-7f13-4731-ab9d-c4499816c10a', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'dialog', '2010-09-23 10:32:05.217380', 'Started new dialog (Unknown Dialog) for (+18474092757).');
INSERT INTO "events" VALUES('610a5804-c403-4073-854a-b023df848f44', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'send', '2010-09-23 10:34:05.203916', 'Sending message to (+18477307314): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('a4ca12bb-e961-4619-abb6-b8ffcdd6bba1', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'dialog', '2010-09-23 10:34:05.216342', 'Started new dialog (Unknown Dialog) for (+18477307314).');
INSERT INTO "events" VALUES('977a84d1-055d-4e6c-a02d-4bfad1d0b292', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'send', '2010-09-23 10:36:05.205985', 'Sending message to (+18475331729): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('066bd6d4-9f07-4f52-8b8f-1bfa3dc17904', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'dialog', '2010-09-23 10:36:05.218912', 'Started new dialog (Unknown Dialog) for (+18475331729).');
INSERT INTO "events" VALUES('0d1d2629-4c31-428c-bc9e-7a60ac2840c1', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-23 10:38:05.204572', 'Sending message to (+12242206684): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('ff6c5e40-b707-4ffb-80d1-db64086c4901', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'dialog', '2010-09-23 10:38:05.216168', 'Started new dialog (Unknown Dialog) for (+12242206684).');
INSERT INTO "events" VALUES('8110ee01-512d-494f-887c-ead43042df8d', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'receive', '2010-09-23 10:39:20.255781', 'Received [+12242206684]: 1');
INSERT INTO "events" VALUES('e38dce1f-42c8-41a8-b881-ab48bc804084', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'variable', '2010-09-23 10:39:20.284274', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('a900de36-7e64-4283-849e-39f05b1a154c', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-23 10:39:20.300469', 'Sending message to (+12242206684): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('8bc8e518-c1f1-42e5-8e6a-085944723279', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-23 10:40:05.204231', 'Sending message to (+18475303742): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('08f9571e-c282-4166-821d-2738f9573b6e', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'dialog', '2010-09-23 10:40:05.215928', 'Started new dialog (Unknown Dialog) for (+18475303742).');
INSERT INTO "events" VALUES('2d5de6ec-50e7-4122-8219-8b9fe27e21fe', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'receive', '2010-09-23 10:41:15.580443', 'Received [+12242206684]: 1');
INSERT INTO "events" VALUES('9e3e25d6-703d-43cd-8448-6856f564ce2f', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'variable', '2010-09-23 10:41:15.606667', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('4852a51f-c641-4fb5-9684-00801d80bb70', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-23 10:41:15.621286', 'Sending message to (+12242206684): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('349baf0b-98e9-49bd-b2ba-c4bf7e3c9b81', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'send', '2010-09-23 10:41:15.640399', 'Sending message to (+12242206684): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('c99aa979-1103-4834-9891-b6d988cdf234', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 10:42:05.205823', 'Sending message to (+12242206679): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('af346b5d-1551-4483-ba84-d77379c10c89', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'dialog', '2010-09-23 10:42:05.217444', 'Started new dialog (Unknown Dialog) for (+12242206679).');
INSERT INTO "events" VALUES('864063bb-3061-4d1b-985d-6f4602290032', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-23 10:44:05.206030', 'Sending message to (+17733199759): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('67cecba7-3f59-4ce5-91bd-737b94652633', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'dialog', '2010-09-23 10:44:05.219010', 'Started new dialog (Unknown Dialog) for (+17733199759).');
INSERT INTO "events" VALUES('a4354922-7876-4ff6-ac2e-95a91ac0cf70', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'send', '2010-09-23 10:46:05.206389', 'Sending message to (+19547016889): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('19b674c3-2ced-47f3-9949-e2d6cd2a47b2', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'dialog', '2010-09-23 10:46:05.217580', 'Started new dialog (Unknown Dialog) for (+19547016889).');
INSERT INTO "events" VALUES('62abe980-9d48-44fd-9bd2-590393a78eab', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'receive', '2010-09-23 10:47:15.106434', 'Received [+18475303742]: 1');
INSERT INTO "events" VALUES('c2155301-cc0f-42b2-8f81-f4f1ab769382', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'variable', '2010-09-23 10:47:15.133420', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('fcd7d3a7-58f2-423f-b2de-6a5f22b8dc2c', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-23 10:47:15.153366', 'Sending message to (+18475303742): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('b761406d-3d24-48c5-9b7a-c5d8875afeda', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'send', '2010-09-23 10:48:05.205643', 'Sending message to (+18476301104): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('89ea3f03-aa46-461c-bffe-4718352dbdec', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'dialog', '2010-09-23 10:48:05.218516', 'Started new dialog (Unknown Dialog) for (+18476301104).');
INSERT INTO "events" VALUES('60f42967-af94-4c21-adef-6e45838c71ff', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'receive', '2010-09-23 10:48:07.615682', 'Received [+18475303742]: 1');
INSERT INTO "events" VALUES('37cb61fe-03ba-48ae-89ff-112f8c16bebe', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'variable', '2010-09-23 10:48:07.643281', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('2fbc7853-0484-4b1b-a676-ca51e56c0238', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-23 10:48:07.661161', 'Sending message to (+18475303742): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('de40914c-e00e-4fc5-a4f6-ce268f6c330d', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'send', '2010-09-23 10:48:07.679279', 'Sending message to (+18475303742): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('ab4b3966-0d2f-428e-a303-63251942a7bb', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-23 10:50:05.205482', 'Sending message to (+17739608723): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('eb80460d-aa26-4393-b8dd-dead7552e98e', 'ae5916c0-df49-4902-966c-747817c517e5', 'dialog', '2010-09-23 10:50:05.217854', 'Started new dialog (Unknown Dialog) for (+17739608723).');
INSERT INTO "events" VALUES('14eda166-1260-49ab-8c54-6b27016def84', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:52:05.209363', 'Sending message to (+13123396771): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('cf66cdb8-0cd2-4876-9d35-e99abfff829d', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'dialog', '2010-09-23 10:52:05.221909', 'Started new dialog (Unknown Dialog) for (+13123396771).');
INSERT INTO "events" VALUES('27a63a25-0ecd-4c13-a0bc-4191371a4111', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 10:53:25.353332', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('aa27c820-c428-4b25-8743-94502a4fd5da', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 10:53:25.381651', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('4a047b62-e2a4-4d25-b1e0-304acfc6df40', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:53:25.395991', 'Sending message to (+18477700637): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('1d0955a4-ee9f-4175-8ede-fb65b608fa03', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 10:53:49.484757', 'Received [+18477700637]: 1');
INSERT INTO "events" VALUES('cb94bdeb-00d0-4c91-9ffd-fa88431466dc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 10:53:49.509139', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('c768e7aa-93df-40ea-b044-a250715b5edc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:53:49.526194', 'Sending message to (+18477700637): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('7f090d6b-d7f3-4bd1-9998-b6dd458823a5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:53:49.544553', 'Sending message to (+18477700637): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('69399299-6675-4d25-8424-dee7458e2755', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 10:54:05.205048', 'Sending message to (+12242206862): We would like to ask a few questions about how you are feeling. REPLY 1 when you have 5 minutes to answer the questions.');
INSERT INTO "events" VALUES('b1d8e444-70f6-4b68-8d93-f8cbfb8b848a', '74287e79-e01c-4170-ac84-94b265775cf3', 'dialog', '2010-09-23 10:54:05.216595', 'Started new dialog (Unknown Dialog) for (+12242206862).');
INSERT INTO "events" VALUES('85fcfe80-2959-4dc5-b239-56f91bc716f3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 10:54:13.351065', 'Received [+18477700637]: 4');
INSERT INTO "events" VALUES('1898501a-0e4a-4e1b-b0eb-d1b583a124ca', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 10:54:13.385769', 'Set ''epnds:blame'' = ''4''.');
INSERT INTO "events" VALUES('d712624c-b5be-47be-b597-183f02f0f008', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:54:13.403632', 'Sending message to (+18477700637): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('5d03aa73-e2a0-40e5-853e-cf5c470bec82', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 10:54:28.456484', 'Received [+18477700637]: 4');
INSERT INTO "events" VALUES('64ff69ce-2e52-4fed-af10-1dfa924ce4c8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 10:54:28.482978', 'Set ''epnds:anxious'' = ''4''.');
INSERT INTO "events" VALUES('fcda5c5e-07ae-42c1-8ce4-2d40670e1ce6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:54:28.497991', 'Sending message to (+18477700637): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('0defb5ac-eb28-466a-ae1c-c2a907488cae', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-23 10:54:43.209458', 'Received [+18477700637]: 4');
INSERT INTO "events" VALUES('f4c7221d-45af-44c5-8f07-2e31f8e92352', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-23 10:54:43.235207', 'Set ''epnds:afraid'' = ''4''.');
INSERT INTO "events" VALUES('1e457a85-69ba-4498-8041-7dd790557f34', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-23 10:54:43.250292', 'Sending message to (+18477700637): Thank you for completing this survey!');
INSERT INTO "events" VALUES('66f61e5d-85e1-4663-8de8-7cdf043df86c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-23 10:54:43.262428', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('91ea6d6b-5a0d-4a45-947e-b51a1f48ae0a', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-23 10:55:25.412347', 'Received [+13123396771]: 1');
INSERT INTO "events" VALUES('ecb691bb-d522-4a0e-838e-38584211b934', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'variable', '2010-09-23 10:55:25.438355', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('ec9aab31-c4b3-4966-ae14-f6936dbc48e8', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:55:25.453789', 'Sending message to (+13123396771): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('14bc9d0b-c10f-4b0b-a488-751b8dc6363e', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-23 10:56:38.985338', 'Received [+12242206862]: 1');
INSERT INTO "events" VALUES('ac7522b5-77d9-42ff-ab3f-427740aff4cd', '74287e79-e01c-4170-ac84-94b265775cf3', 'variable', '2010-09-23 10:56:39.014612', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('e3bce6dc-89b1-429f-a940-d07b58c0c7bf', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 10:56:39.030411', 'Sending message to (+12242206862): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('4237de0e-084a-4626-b093-46c52b9f5d11', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-23 10:58:21.248262', 'Received [+13123396771]: 1');
INSERT INTO "events" VALUES('45c8662f-5e3f-449e-8851-ce9e147d953c', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'variable', '2010-09-23 10:58:21.274829', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('5f89499e-fc39-4438-863d-aefd3eb868b0', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:58:21.290163', 'Sending message to (+13123396771): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('80b307cc-351f-462e-85eb-5db599bc2062', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:58:21.308907', 'Sending message to (+13123396771): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('f55d0905-c004-4aca-98a8-2fb11da517d4', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-23 10:58:41.389598', 'Received [+13123396771]: 4');
INSERT INTO "events" VALUES('8fe9ad18-a601-40f6-8551-bd4ea6f12e36', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'variable', '2010-09-23 10:58:41.419371', 'Set ''epnds:blame'' = ''4''.');
INSERT INTO "events" VALUES('69508dee-f27a-40e0-9c0f-7fe56bc41cec', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:58:41.436987', 'Sending message to (+13123396771): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('b6795e0f-c5ca-4cf8-9a1c-cd4af6421a53', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-23 10:58:59.501076', 'Received [+13123396771]: 4');
INSERT INTO "events" VALUES('bd1bf548-cdaa-4d0e-9880-c53ef9d99b4c', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'variable', '2010-09-23 10:58:59.528971', 'Set ''epnds:anxious'' = ''4''.');
INSERT INTO "events" VALUES('3553a9d9-8c06-474d-ba2e-bc7f300425d8', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:58:59.547113', 'Sending message to (+13123396771): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('adec6ce6-15a5-4f0b-818b-321e8de93539', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-23 10:59:17.348006', 'Received [+13123396771]: 2');
INSERT INTO "events" VALUES('1ae88fdd-605c-4b5b-988b-fbcd025129cf', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'variable', '2010-09-23 10:59:17.374690', 'Set ''epnds:afraid'' = ''2''.');
INSERT INTO "events" VALUES('9cd49a89-0d42-4b4d-b1eb-bf5077762658', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-23 10:59:17.390240', 'Sending message to (+13123396771): Thank you for completing this survey!');
INSERT INTO "events" VALUES('83998f9c-dad8-4522-ba76-70f643265515', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'dialog', '2010-09-23 10:59:17.402962', 'Finished dialog for (+13123396771).');
INSERT INTO "events" VALUES('d0da0938-5005-428d-b92b-a092c976824d', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-23 10:59:31.297464', 'Received [+12242206862]: 1');
INSERT INTO "events" VALUES('7b584720-8e27-4bfa-8fe9-af37d544c268', '74287e79-e01c-4170-ac84-94b265775cf3', 'variable', '2010-09-23 10:59:31.323387', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('2b3dc4a4-73a7-4c7f-9fe8-1acd2ecce975', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 10:59:31.338485', 'Sending message to (+12242206862): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('976fc229-cf1b-4ac2-a468-b962a1de365a', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 10:59:31.357324', 'Sending message to (+12242206862): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('591d48a7-6e7b-4420-92b9-001dd93239de', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'receive', '2010-09-23 11:02:11.185220', 'Received [+12242206679]: 1');
INSERT INTO "events" VALUES('77038e94-8038-42a2-8382-d2fbe23ce050', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'variable', '2010-09-23 11:02:11.210969', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('f4fb9510-6447-4a1b-9030-114bb440c0b4', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 11:02:11.225780', 'Sending message to (+12242206679): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('9ed00626-4e85-40c8-921c-185fbb24f726', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-23 11:02:17.395948', 'Received [+12242206862]: 3');
INSERT INTO "events" VALUES('f67c21fe-39cf-4b3a-85a1-527011aadffb', '74287e79-e01c-4170-ac84-94b265775cf3', 'variable', '2010-09-23 11:02:17.421969', 'Set ''epnds:blame'' = ''3''.');
INSERT INTO "events" VALUES('c7d61b85-d7cd-4ff0-ad4a-dcf204ec3366', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 11:02:17.438703', 'Sending message to (+12242206862): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('31b93b9a-1064-4b2b-b145-c507dfa6d3b7', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'receive', '2010-09-23 11:03:51.773809', 'Received [+12242206679]: 1');
INSERT INTO "events" VALUES('a838bf2b-224d-4111-943c-af4413109d86', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'variable', '2010-09-23 11:03:51.799768', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('aac9ebe4-8f14-47c1-a8c0-3b74f133705f', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 11:03:51.814979', 'Sending message to (+12242206679): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('c50a14fe-aaea-4bf1-92a9-3e55ac269460', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'send', '2010-09-23 11:03:51.833473', 'Sending message to (+12242206679): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('77fc4fb8-3201-4aca-b544-8c5ad8acc1d7', '74287e79-e01c-4170-ac84-94b265775cf3', 'receive', '2010-09-23 11:05:05.338996', 'Received [+12242206862]: 2');
INSERT INTO "events" VALUES('faccd6de-7289-459a-9778-41359423b204', '74287e79-e01c-4170-ac84-94b265775cf3', 'variable', '2010-09-23 11:05:05.366114', 'Set ''epnds:anxious'' = ''2''.');
INSERT INTO "events" VALUES('e3f25953-3c53-44c9-b54b-97a5121c0447', '74287e79-e01c-4170-ac84-94b265775cf3', 'send', '2010-09-23 11:05:05.381276', 'Sending message to (+12242206862): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('da677fd2-50ba-44b3-9437-baae72adcf08', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-23 12:07:21.065153', 'Received [+18474092757]: 1');
INSERT INTO "events" VALUES('dc687695-67e2-4f76-8c3e-8f7dcb064054', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-09-23 12:07:21.090092', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('a4ff82e2-685d-478f-90a4-30f712ea70a6', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:07:21.105776', 'Sending message to (+18474092757): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('510063f6-da13-41e4-a154-a57bb72ee31c', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-23 12:08:04.009011', 'Received [+18474092757]: 1');
INSERT INTO "events" VALUES('be7d263c-9774-4262-b836-a102bdb34510', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-09-23 12:08:04.036388', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('25465813-5dd1-4955-b5ea-5368b9c6f0e3', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:08:04.052021', 'Sending message to (+18474092757): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('ede981a4-3ec4-42d7-8ffa-3454d36f9c2f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:08:04.070952', 'Sending message to (+18474092757): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('2ca5390a-b804-41b5-aa46-b964417873a3', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-23 12:09:14.544866', 'Received [+18474092757]: 3');
INSERT INTO "events" VALUES('caa15bbf-b623-4f07-8d14-a1d29ce19059', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-09-23 12:09:14.568980', 'Set ''epnds:blame'' = ''3''.');
INSERT INTO "events" VALUES('3db3d612-4547-427e-92bf-8442827f8c82', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:09:14.583370', 'Sending message to (+18474092757): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('3a71ea81-bd6f-494d-a35c-c581bc4e95ab', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-23 12:10:05.444004', 'Received [+18474092757]: 1');
INSERT INTO "events" VALUES('0d4c5d32-030b-4a84-907f-a34377c74a83', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-09-23 12:10:05.471566', 'Set ''epnds:anxious'' = ''1''.');
INSERT INTO "events" VALUES('b1ee2082-0996-4b3f-ab7d-8fb3252e2764', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:10:05.485892', 'Sending message to (+18474092757): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('14521500-bdd9-47fc-9857-61fb63933c85', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-23 12:10:41.616768', 'Received [+18474092757]: 3');
INSERT INTO "events" VALUES('8d6a661c-5064-45a3-b41e-6bfafe7287ae', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-09-23 12:10:41.642308', 'Set ''epnds:afraid'' = ''3''.');
INSERT INTO "events" VALUES('4d295ec9-1cb5-4bd7-8ec4-8bfdee4b83a1', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-23 12:10:41.656940', 'Sending message to (+18474092757): Thank you for completing this survey!');
INSERT INTO "events" VALUES('d9599a96-85c6-49dc-bb50-016ea15b98fa', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'dialog', '2010-09-23 12:10:41.668850', 'Finished dialog for (+18474092757).');
INSERT INTO "events" VALUES('67a00a79-bb08-44b3-9d83-40ac31384d9a', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-24 03:05:06.443823', 'Received [+17733199759]: 1');
INSERT INTO "events" VALUES('0f98658b-5b90-4d36-8a0a-e48546ec9c73', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-24 03:05:06.482090', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('7b8796b5-b2c5-4bf9-89c6-ae0bc2ac51fc', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:05:06.497167', 'Sending message to (+17733199759): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('635aaeb2-9d12-4a5a-a09d-c8fd0ed5dae8', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-24 03:05:38.538567', 'Received [+17733199759]: 1');
INSERT INTO "events" VALUES('cbb15787-e3cf-4b0a-a0f1-c2c330f5274a', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-24 03:05:38.564507', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('7d763cb8-6001-405d-9e49-231df18abe6d', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:05:38.579889', 'Sending message to (+17733199759): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('9ca7f967-bf75-4ce0-80ce-56bd1d563f87', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:05:38.597928', 'Sending message to (+17733199759): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('6dda30f8-188f-4327-b06e-b6a9b09c806c', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-24 03:06:08.132165', 'Received [+17733199759]: 2');
INSERT INTO "events" VALUES('c302cea3-0e3f-47ef-ace1-912c9b65d4b3', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-24 03:06:08.158247', 'Set ''epnds:blame'' = ''2''.');
INSERT INTO "events" VALUES('f16cc71b-513f-4b09-96b3-786ce76eea25', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:06:08.173415', 'Sending message to (+17733199759): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('52f10908-391a-4583-90d2-59393d71a006', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-24 03:06:49.346330', 'Received [+17733199759]: 3');
INSERT INTO "events" VALUES('2ebd1ae7-8489-4f70-9e4f-481a514373a8', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-24 03:06:49.373610', 'Set ''epnds:anxious'' = ''3''.');
INSERT INTO "events" VALUES('3134600e-a4eb-4a80-8349-5ffa6a1cd4c3', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:06:49.391437', 'Sending message to (+17733199759): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('455dae74-2690-4eff-b916-1c21bb737819', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'receive', '2010-09-24 03:07:37.634228', 'Received [+17733199759]: 4');
INSERT INTO "events" VALUES('04bb8fe0-0209-406f-b601-ee1422914fb1', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'variable', '2010-09-24 03:07:37.659685', 'Set ''epnds:afraid'' = ''4''.');
INSERT INTO "events" VALUES('0c3246e2-6d88-41b1-8006-c3f83769453f', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'send', '2010-09-24 03:07:37.674867', 'Sending message to (+17733199759): Thank you for completing this survey!');
INSERT INTO "events" VALUES('437a8fcf-3134-4c05-9df8-1e4e332870b8', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'dialog', '2010-09-24 03:07:37.687180', 'Finished dialog for (+17733199759).');
INSERT INTO "events" VALUES('66f71d7f-d8b1-46a0-8f5e-baba010c743d', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:00:46.770701', 'Received [+17739608723]: 1');
INSERT INTO "events" VALUES('411f231a-aaaa-4384-bdf9-7b3949086785', 'ae5916c0-df49-4902-966c-747817c517e5', 'variable', '2010-09-24 11:00:46.820307', 'Set ''epnds:ready'' = ''1''.');
INSERT INTO "events" VALUES('6e25029c-3ab2-4b12-8952-99f654179b91', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:00:46.880505', 'Sending message to (+17739608723): You indicated that you are ready to tell us how you have been feeling. REPLY 1 to continue.');
INSERT INTO "events" VALUES('0eaf2dc9-f2db-4828-92f4-a41722307002', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:02:12.606493', 'Received [+17739608723]: 1');
INSERT INTO "events" VALUES('732d0ed0-5f61-43a5-9947-fba1a8cd0556', 'ae5916c0-df49-4902-966c-747817c517e5', 'variable', '2010-09-24 11:02:12.635405', 'Set ''epnds:continue'' = ''1''.');
INSERT INTO "events" VALUES('6292536f-fbb7-4af6-8368-08f561e86431', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:02:12.652705', 'Sending message to (+17739608723): Please select the answer which comes closest to how you have felt in the past 7 days - not just how you feel today.');
INSERT INTO "events" VALUES('e0ee5306-1644-4c81-8b79-a8b9722efa36', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:02:12.672606', 'Sending message to (+17739608723): Over the past 7 days, I have blamed myself unnecessarily when things went wrong. Yes, most of the time=1; Yes, some of the time=2; Not very often=3; No, never=4');
INSERT INTO "events" VALUES('c3e89462-7eaa-4878-9a00-7aa44e4b80ff', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:05:01.674631', 'Received [+17739608723]: 1');
INSERT INTO "events" VALUES('61741139-ae98-4c0e-a291-c161c5b99b34', 'ae5916c0-df49-4902-966c-747817c517e5', 'variable', '2010-09-24 11:05:01.699739', 'Set ''epnds:blame'' = ''1''.');
INSERT INTO "events" VALUES('b33162b3-496e-4691-9ffc-e8fb80a63a4c', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:05:01.715366', 'Sending message to (+17739608723): Over the past 7 days, I have been anxious or worried for no good reason. No, not at all=1; Hardly ever=2; Yes, sometimes=3; Yes, very often=4');
INSERT INTO "events" VALUES('492313e4-cb6e-4f3f-991f-6fad254f70c7', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:07:25.033761', 'Received [+17739608723]: 4');
INSERT INTO "events" VALUES('53ae409f-6d76-46e4-acff-3db6df1b4868', 'ae5916c0-df49-4902-966c-747817c517e5', 'variable', '2010-09-24 11:07:25.085625', 'Set ''epnds:anxious'' = ''4''.');
INSERT INTO "events" VALUES('2c963a89-6173-49c5-822f-7778626be81b', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:07:25.100539', 'Sending message to (+17739608723): Over the past 7 days, I have felt scared or panicky for no very good reason. Yes, quite a lot=1; Yes, sometimes=2; No, not much=3; No, not at all=4');
INSERT INTO "events" VALUES('32e75d0c-1253-4fb8-94c7-c427004d75e9', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:07:54.256493', 'Received [+17739608723]: 4');
INSERT INTO "events" VALUES('381d6758-bd11-4e33-89c3-f34fba6a480e', 'ae5916c0-df49-4902-966c-747817c517e5', 'variable', '2010-09-24 11:07:54.298607', 'Set ''epnds:afraid'' = ''4''.');
INSERT INTO "events" VALUES('825ce495-771b-4736-ab26-928a2fc6e1f5', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:07:54.313813', 'Sending message to (+17739608723): Thank you for completing this survey!');
INSERT INTO "events" VALUES('c9744d44-dfc0-47c8-8538-80b93dcfa58f', 'ae5916c0-df49-4902-966c-747817c517e5', 'dialog', '2010-09-24 11:07:54.333699', 'Finished dialog for (+17739608723).');
INSERT INTO "events" VALUES('23a2e5a0-63d9-436a-bb75-13688eadb7b9', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:08:15.843223', 'Received [+17739608723]: 2');
INSERT INTO "events" VALUES('5a9a9ada-9750-4233-83e2-d6c2d12432fa', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:08:15.859317', 'Sending message to (+17739608723): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('5798bce9-87e4-4a1e-9d13-fcabfc790b39', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-24 11:09:55.585382', 'Received [+17739608723]: 411 when should i schedule my next home visit?');
INSERT INTO "events" VALUES('4fa6bd64-15b3-4dfc-9513-3bc06148926f', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:09:55.596985', 'Sent 411 response to (+17739608723).');
INSERT INTO "events" VALUES('20111677-bf86-4934-83d1-5d07c08ae689', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-24 11:09:55.636947', 'Sending message to ((847) 770-0637): Incoming 411 from +17739608723:');
INSERT INTO "events" VALUES('1a503a51-4674-4ca8-9c3c-ad80f2d65fb2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-24 11:09:55.652750', 'Sending message to ((847) 770-0637): 411 when should i schedule my next home visit?');
INSERT INTO "events" VALUES('8df3161f-7e82-4a0d-8bc2-1577dfb2134b', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:09:55.664017', 'Forwarded 411 message from (+17739608723): 411 when should i schedule my next home visit?');
INSERT INTO "events" VALUES('01dac171-1c4e-4fb0-b853-4e8ea7d8d517', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-24 11:09:55.687546', 'Sending message to ((312) 339-6771): Incoming 411 from +17739608723:');
INSERT INTO "events" VALUES('b6823b0d-db9d-4148-bd11-a297efbb2ca1', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-24 11:09:55.719502', 'Sending message to ((312) 339-6771): 411 when should i schedule my next home visit?');
INSERT INTO "events" VALUES('e7ea82a1-7bc2-4605-a61c-4f6be0c9d125', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:09:55.730886', 'Forwarded 411 message from (+17739608723): 411 when should i schedule my next home visit?');
INSERT INTO "events" VALUES('d914d930-e854-4370-b84a-13b01dd11124', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-24 11:09:55.745574', 'Sending message to (+17739608723): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('26b099d8-0b6d-4819-bf6c-6b57c111ab79', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'receive', '2010-09-25 15:42:20.662585', 'Received [+13123396771]: 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('0bab66ab-72a2-440f-b40d-0245807b8745', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-25 15:42:20.686517', 'Sent 411 response to (+13123396771).');
INSERT INTO "events" VALUES('3a78ed93-c05a-4bba-8b79-6c7f6ce9e27d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:42:20.716411', 'Sending message to ((847) 770-0637): Incoming 411 from +13123396771:');
INSERT INTO "events" VALUES('de232992-f970-48c9-b6f0-c2f2d328b4f3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:42:20.866386', 'Sending message to ((847) 770-0637): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('226e5c29-dc6f-45ff-8dd8-b7393ca2d634', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-25 15:42:20.879618', 'Forwarded 411 message from (+13123396771): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('af2e5be2-24ec-4460-b1f8-1bb55dffd01f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:42:20.901115', 'Sending message to (847-409-2757): Incoming 411 from +13123396771:');
INSERT INTO "events" VALUES('ea728339-2054-4688-9246-cb59acd560ce', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:42:20.921405', 'Sending message to (847-409-2757): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('9b7b86a3-cac8-4769-8a8a-0a9318b8535f', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-25 15:42:20.932807', 'Forwarded 411 message from (+13123396771): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('87b75a86-bc3b-4f03-b5ff-c8a90e8e5150', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:42:20.954882', 'Sending message to (773-960-8723): Incoming 411 from +13123396771:');
INSERT INTO "events" VALUES('201c3cd0-66c5-4df1-934f-2c2647e53918', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:42:20.973164', 'Sending message to (773-960-8723): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('85600698-9e91-4089-bf25-e3b989ee37eb', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-25 15:42:20.985775', 'Forwarded 411 message from (+13123396771): 411 testing. reply if you get this. (please)');
INSERT INTO "events" VALUES('0ebc688a-6e99-4029-a810-90599afbd87c', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-25 15:42:21.001799', 'Sending message to (+13123396771): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('09fb798d-d5ff-4f05-b938-9f1b729e01b2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-25 15:42:46.397450', 'Received [+18477700637]: got it');
INSERT INTO "events" VALUES('1bc20321-4177-4cad-86c3-97239a14871f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:42:46.413487', 'Sending message to (+18477700637): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('d1d7c4c8-70c5-4b02-b646-6c39c0b81023', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-25 15:43:14.677726', 'Received [+18474092757]: got it');
INSERT INTO "events" VALUES('8e73733a-cb02-4539-b5eb-4064eccb71f4', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:43:14.693972', 'Sending message to (+18474092757): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('2a558490-4213-475d-a51d-c47caae56ed9', 'ae5916c0-df49-4902-966c-747817c517e5', 'receive', '2010-09-25 15:43:33.124018', 'Received [+17739608723]: reply');
INSERT INTO "events" VALUES('8f4c7e80-7ff8-47a4-abd1-09bc0197335f', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:43:33.140008', 'Sending message to (+17739608723): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('eef9d579-2cd0-41ed-ab82-360756f462c2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-25 15:43:36.461871', 'Received [+18477700637]: 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('cdf7c218-5133-42e5-8db4-6bc79d48af32', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.471460', 'Sent 411 response to (+18477700637).');
INSERT INTO "events" VALUES('cf2c16e2-eb86-42aa-b838-35876cf6596c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.499250', 'Sending message to ((847) 770-0637): Incoming 411 from +18477700637:');
INSERT INTO "events" VALUES('2727d278-c7e4-498b-9ed3-dd4b8202f103', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.515349', 'Sending message to ((847) 770-0637): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('97e74332-df8f-4010-974e-2d84be48bf2a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.526197', 'Forwarded 411 message from (+18477700637): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('df16b154-8dac-49d3-bc6a-46671de01ea2', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:43:36.548698', 'Sending message to (847-409-2757): Incoming 411 from +18477700637:');
INSERT INTO "events" VALUES('809f15fe-c808-4408-b0ef-a6cc11b0bdae', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:43:36.568013', 'Sending message to (847-409-2757): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('e3d689d9-f814-45d1-a72c-9da5876c1ac6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.580888', 'Forwarded 411 message from (+18477700637): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('56f4bc99-b8da-4237-9a5c-e80c34a353d5', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:43:36.603172', 'Sending message to (773-960-8723): Incoming 411 from +18477700637:');
INSERT INTO "events" VALUES('f316b3e2-565f-4203-a035-a0bd0a3c2358', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:43:36.621359', 'Sending message to (773-960-8723): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('e7db86e8-a90c-4ba4-8f03-f3a1b0a847b7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.632590', 'Forwarded 411 message from (+18477700637): 411 oops. reply to the number stated in the incoming message. :-)');
INSERT INTO "events" VALUES('807c7e5a-d1a0-498d-a90a-b51fea86e2f8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:43:36.647223', 'Sending message to (+18477700637): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('7bf7ef88-6207-40c2-91b3-01d895dee7be', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-09-25 15:45:52.835819', 'Received [+18474092757]: 411 reply');
INSERT INTO "events" VALUES('77cf2e8a-9eae-4af5-807a-3a59558ea4a1', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:52.848102', 'Sent 411 response to (+18474092757).');
INSERT INTO "events" VALUES('e2b9062b-cd14-460f-a910-8d63161c2bcb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:45:52.876246', 'Sending message to ((847) 770-0637): Incoming 411 from +18474092757:');
INSERT INTO "events" VALUES('163715cb-e753-408a-b4a6-b80e051c4fab', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-25 15:45:52.892631', 'Sending message to ((847) 770-0637): 411 reply');
INSERT INTO "events" VALUES('d5d32b23-b5e5-4888-bc09-82bef96eb7ea', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:52.904491', 'Forwarded 411 message from (+18474092757): 411 reply');
INSERT INTO "events" VALUES('b69dbeb0-7cb7-4702-81f5-c0f2a81f44d5', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:52.925642', 'Sending message to (847-409-2757): Incoming 411 from +18474092757:');
INSERT INTO "events" VALUES('939e5c98-93dd-4338-9b4a-4a17eaec5ab7', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:52.942783', 'Sending message to (847-409-2757): 411 reply');
INSERT INTO "events" VALUES('d29b11e2-3da1-4cda-99c6-e2093b9a0d97', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:52.953931', 'Forwarded 411 message from (+18474092757): 411 reply');
INSERT INTO "events" VALUES('6a85e728-7fde-49af-97d4-a46ff6461040', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:45:52.975917', 'Sending message to (773-960-8723): Incoming 411 from +18474092757:');
INSERT INTO "events" VALUES('c90f44f9-d887-401f-a219-f1bfbbc5ab57', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-09-25 15:45:52.993979', 'Sending message to (773-960-8723): 411 reply');
INSERT INTO "events" VALUES('859cc70e-b7bb-40bf-a50a-ccdbb734d074', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:53.006162', 'Forwarded 411 message from (+18474092757): 411 reply');
INSERT INTO "events" VALUES('7f0d0a11-33c2-4df8-b5d0-edaf34e98b58', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-09-25 15:45:53.020491', 'Sending message to (+18474092757): Your message has been received. We will respond shortly.');
INSERT INTO "events" VALUES('d39f60f8-e2aa-4e94-87b8-4e15c6d6f8d1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:02:53.059073', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('f7ab6147-6669-4129-a1ba-08319ae8ccac', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:03:01.277703', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('211091aa-b4b9-4b74-811d-5ab86a913f95', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:03:01.297800', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('ed518720-55fc-449a-9681-1bc7f2b930e4', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:03:24.167591', 'Received [+18477700637]: sure');
INSERT INTO "events" VALUES('a9a4a6f8-e515-4106-ba3e-8acd28d71403', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:03:24.208356', 'Set ''first_question'' = ''sure''.');
INSERT INTO "events" VALUES('1528922a-e220-4e02-aab5-1792438c96b3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:03:24.222403', 'Sending message to (+18477700637): ');
INSERT INTO "events" VALUES('bdbb3211-5af7-468a-9b0c-9e98a18b7b46', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:03:24.234863', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('ee63c7f6-3d10-4c3e-abae-7411287c2b76', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:06:49.473261', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('784a0cfe-5721-4f7f-9ad1-a54108eae165', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:07:01.150766', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('2675af6e-e333-4bc2-b560-b8c3c512d09d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:07:01.173996', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('ad6ab121-7fbd-4330-b48c-83940cc24441', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:07:13.097199', 'Received [+18477700637]: ffffhg');
INSERT INTO "events" VALUES('b5f63fb5-1f6b-4eb7-b4a8-57f5e5eb8f4d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:07:13.120686', 'Set ''first_question'' = ''ffffhg''.');
INSERT INTO "events" VALUES('85111b8d-2164-48d4-a47e-d649031e5943', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:11:31.765384', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('821acdbd-5e68-4163-b851-46ba2509394d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:11:34.912927', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('35120ba1-9b42-40ee-869a-d9227363623f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:11:34.925261', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('23bdc029-2caf-428f-93cf-02668a7d88c4', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:11:51.126232', 'Received [+18477700637]: idtyh');
INSERT INTO "events" VALUES('986ecd82-b2cf-4aeb-b1b5-538213d77ba3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:11:51.179199', 'Set ''first_question'' = ''idtyh''.');
INSERT INTO "events" VALUES('ad454004-2adb-4723-aa6a-63759630c324', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:14:54.358946', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('9e0e38da-7101-441f-be2e-5620a042b886', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:15:20.760258', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('7993c8c9-29bf-40af-bdec-59f2f2528770', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:15:20.774020', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('4761d2d2-d965-4581-acf5-636fc6708e01', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:15:41.489918', 'Received [+18477700637]: vbcchchfhj');
INSERT INTO "events" VALUES('8e495565-9965-4348-b266-c72b7d969575', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:15:41.538688', 'Set ''first_question'' = ''vbcchchfhj''.');
INSERT INTO "events" VALUES('02b2535e-6306-486e-aeab-7f94781da75e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:15:41.586645', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('7c172724-c7ce-444a-b209-abcbac1ac99c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:15:41.597960', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('ee95d0ed-cdb9-40fc-ba34-1aae5afac4ec', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:18:16.849884', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('88458910-2dc5-425d-9f7f-1933ed75fba5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:20:18.029652', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('b6f614fb-206c-4363-8f52-0b9cb15887e5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:21:59.930994', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('75b80795-c125-4579-90b0-3b4c656d49b1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:22:08.748283', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('9b8d8dee-3417-4c97-8450-a7b931effbeb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:22:08.759788', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('a319fc0b-8e37-4c99-bd0a-a31b4f69e176', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:22:29.670017', 'Received [+18477700637]: offer');
INSERT INTO "events" VALUES('83a61098-57ac-44a6-885b-d50d2a5cb487', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:22:29.703557', 'Set ''first_question'' = ''offer''.');
INSERT INTO "events" VALUES('1107efd1-5c9f-4bc3-b146-9aca15d89081', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:22:29.726123', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('627bb963-2f3f-4f37-8b97-b339c57d69e7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:36:13.276041', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('5d973e74-1809-4f21-9519-04f02aaf3dda', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:36:40.164398', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('8e5bf816-0dfe-4f0e-86af-f0c99233826d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:36:40.175518', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('34e61f06-a65c-4d6c-9534-1763d2420c01', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:37:07.959883', 'Received [+18477700637]: fffhdhhgg');
INSERT INTO "events" VALUES('c051e6f8-ab11-46bd-be97-daf06a88d811', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:37:07.987156', 'Set ''first_question'' = ''fffhdhhgg''.');
INSERT INTO "events" VALUES('e8f601c1-d80d-4a0f-b611-f8c459308e47', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:37:08.009380', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('2c57b78f-d48f-4b9d-8c61-ac34f6641cc1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:38:07.612037', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('1a6643ec-5b3a-4f65-a620-038b7094a135', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:38:36.250649', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('714983b2-8e1c-47ca-b199-4d1a4a237f6f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:38:36.261963', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('ed60fe88-8fa9-4f19-8dad-d5ff0b0a62b4', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:39:07.974865', 'Received [+18477700637]: jhfddhgfghj');
INSERT INTO "events" VALUES('2e15acb3-4abb-4f1f-954d-9ef87b6cd7c0', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:39:08.002173', 'Set ''first_question'' = ''jhfddhgfghj''.');
INSERT INTO "events" VALUES('e29625de-f837-4ba9-bd44-105f888d13fd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:39:08.025204', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('bdd233ab-0fad-4708-a302-ba31c6a9b14c', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:39:08.041978', 'Sending message to (13128980321): Reminder response from CASE_NUMBER...');
INSERT INTO "events" VALUES('87961e76-41b2-4a92-9253-e0c12a08bc10', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:40:56.254821', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('2c0eab64-2e17-49a9-90d5-ccb684bf5cb5', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:41:02.232810', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('64ab5791-f059-4560-bf37-77a1af98e418', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:41:02.245074', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('3c797ff9-53f2-43b5-82f1-3b80f6f378d7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:41:23.732419', 'Received [+18477700637]: it sure does');
INSERT INTO "events" VALUES('11776556-0b82-4c90-b178-2cd520e15f0b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:41:23.759963', 'Set ''first_question'' = ''it sure does''.');
INSERT INTO "events" VALUES('2e0f05c6-8ddd-4357-b95b-9e61724fb16e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:41:23.782500', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('c2d7e092-72e0-41e0-8076-3880119ace4b', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:41:23.800872', 'Sending message to (13128980321): Reminder response from CASE_NUMBER...');
INSERT INTO "events" VALUES('b8c04689-e53a-4945-a2f3-cc926a3e22f0', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:41:23.817395', 'Sending message to (13128980321): REMINDER TEXT HERE');
INSERT INTO "events" VALUES('45e7fe00-6275-4e44-a927-9920d14d3d25', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:41:23.834709', 'Sending message to (13128980321): Response from CASE_NUMBER:');
INSERT INTO "events" VALUES('f6a72115-97f5-4122-aed1-70fef188d110', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:41:23.851989', 'Sending message to (13128980321): TODO: Send first_question');
INSERT INTO "events" VALUES('4aad21a6-fcad-4a74-b39a-1ef0b00b20fc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:41:23.863448', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('7495a84b-cbd1-4a18-a481-a65ef707c14f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:48:23.000362', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('a0a1f043-0fca-4b31-82ac-51fc966a237f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:48:34.714670', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('248acb1f-72b4-4a67-8388-ef97125bc113', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:48:34.725852', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('46b252f3-f7eb-40e7-827b-793b01ae11b3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:48:54.277067', 'Received [+18477700637]: xgg');
INSERT INTO "events" VALUES('0dea0e9c-5b7d-4b07-8693-6c77ce2891d3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:48:54.303568', 'Set ''first_question'' = ''xgg''.');
INSERT INTO "events" VALUES('91cf5c45-f404-4934-ab59-aa19d6057121', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:48:54.325446', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('db2eb386-7b42-4844-868f-39ee30cb58c7', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:48:54.342559', 'Sending message to (13128980321): Reminder response from CASE_NUMBER...');
INSERT INTO "events" VALUES('14a16c9e-9df0-4541-8e30-f3ae9aa4b43b', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:48:54.360877', 'Sending message to (13128980321): REMINDER TEXT HERE');
INSERT INTO "events" VALUES('dc73b605-b3c4-43de-baff-7e2c5b1f2c0c', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:48:54.378787', 'Sending message to (13128980321): Response from CASE_NUMBER:');
INSERT INTO "events" VALUES('7dcadefe-e2f1-4429-931c-7e36fc0a9743', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:48:54.389959', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('498836ce-2656-450b-8931-b06aad026313', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:52:01.616039', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('7c6bdadf-7421-4874-8f13-fa014efa20d0', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:52:20.122421', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('7dcba02b-961d-440f-a32c-e88588aa228a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:52:20.134691', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('ba5de105-f570-495e-9478-dd754e312cb8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:53:00.030585', 'Received [+18477700637]: ffffhg');
INSERT INTO "events" VALUES('6e337155-df83-4b0e-a27a-ca8827073f98', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:53:00.056037', 'Set ''first_question'' = ''ffffhg''.');
INSERT INTO "events" VALUES('7312e49e-1774-41c2-92ef-f60d6af1db26', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:53:00.078680', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('d8de7ce1-222c-4c1d-84ae-92415736ea0e', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:53:00.095611', 'Sending message to (13128980321): Reminder response from CASE_NUMBER...');
INSERT INTO "events" VALUES('034228f5-4923-4d6d-9a8d-18c331e68bee', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:53:00.112407', 'Sending message to (13128980321): REMINDER TEXT HERE');
INSERT INTO "events" VALUES('a1500310-ce5d-49d4-aaee-e4b213dd4782', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:53:00.132008', 'Sending message to (13128980321): Response from CASE_NUMBER:');
INSERT INTO "events" VALUES('2ec85816-81cc-4ca3-95ea-25390ff6e857', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:53:00.150527', 'Sending message to (13128980321): first_question');
INSERT INTO "events" VALUES('91399756-ee1a-4d1b-8ffe-3255516b85d7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:53:00.161477', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('38698a06-0686-4620-90a8-560d0aa38980', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 10:53:55.433610', 'Scheduled message: cf530b5a-26b5-47dc-9be3-7605af4f17bd (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('5f12e0fa-2909-4ba0-8ce0-659dbeb6c29f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:54:20.108781', 'Sending message to (+18477700637): Does this reminder work?');
INSERT INTO "events" VALUES('d9c2aebe-b580-4470-b446-70baad5643bc', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:54:20.122021', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('b23af42c-101a-4173-b9b5-7cd2ad5d2809', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 10:54:38.545951', 'Received [+18477700637]: iffy');
INSERT INTO "events" VALUES('e8ef026d-5932-433c-8bd8-8929b5b0c4f3', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 10:54:38.570018', 'Set ''first_question'' = ''iffy''.');
INSERT INTO "events" VALUES('9d196ac7-469b-4c88-a7f4-fd58995bb1eb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 10:54:38.589404', 'Sending message to (+18477700637): It seems so....');
INSERT INTO "events" VALUES('c3467572-0dc2-4b3f-b0c5-a5c9c660de21', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:54:38.609559', 'Sending message to (13128980321): Reminder response from CASE_NUMBER...');
INSERT INTO "events" VALUES('68d14087-1ed7-4a69-a302-2958b7bc735c', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:54:38.626454', 'Sending message to (13128980321): REMINDER TEXT HERE');
INSERT INTO "events" VALUES('37c6bedd-ff0b-4ef9-8de4-72c6f145030b', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:54:38.644561', 'Sending message to (13128980321): Response from CASE_NUMBER:');
INSERT INTO "events" VALUES('23d14b3c-6ff2-41fe-97a8-b12461296640', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:54:38.663046', 'Sending message to (13128980321): first_question');
INSERT INTO "events" VALUES('88c6e7a7-86a6-4d54-a68d-71f9cdddb5fb', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 10:54:38.680007', 'Sending message to (13128980321): iffy');
INSERT INTO "events" VALUES('1c41527a-5072-4ae3-bd2e-89c10f972fce', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 10:54:38.690821', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('e27876d0-8140-4e0d-903d-8eb082b44b42', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 14:58:53.800533', 'Scheduled message: b260c0ad-0aad-4fbe-a02e-469e143107c4 (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('b7b22a0a-de6d-48ec-ad90-6caeeb9b81c9', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 14:59:22.179473', 'Sending message to (+18477700637): Does this reminder work?Will you be able to meet with your home visitor tomorrow as previously scheduled?');
INSERT INTO "events" VALUES('36047c3d-3c25-497d-83d3-7dbf7073a338', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 14:59:22.190902', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('c397166c-a1c1-47e7-9f7c-7f126ade6fe2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 15:00:05.015725', 'Received [+18477700637]: gfff');
INSERT INTO "events" VALUES('0407d381-e618-4bf9-b0ea-d846822edc8a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 15:00:05.040800', 'Set ''first_question'' = ''gfff''.');
INSERT INTO "events" VALUES('ea4d4692-9f4c-42b8-849a-ad51f8a1ddbd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 15:00:05.064808', 'Sending message to (+18477700637): Thanks for letting us know. Your response has been forwarded to your visitor.');
INSERT INTO "events" VALUES('2501ad4b-e7b6-4874-9640-e3d48835bbdf', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 15:00:05.084060', 'Sending message to (13128980321): Reminder response from --CASE_NUMBER--...');
INSERT INTO "events" VALUES('d1349848-cf91-4e0a-87e6-3c1f79fc30b2', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 15:00:05.103090', 'Sending message to (13128980321): Will you be able to meet with your home visitor tomorrow as previously scheduled?');
INSERT INTO "events" VALUES('f02509d1-fd65-4de6-b81b-b71f68bbffd8', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 15:00:05.123831', 'Sending message to (13128980321): Response from --CASE_NUMBER--:');
INSERT INTO "events" VALUES('9dbb7c30-6488-4b53-b6f6-c0d2c06b0001', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 15:00:05.141365', 'Sending message to (13128980321): first_question');
INSERT INTO "events" VALUES('6599a3ef-4a83-4063-a669-ec25632f2eca', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'send', '2010-09-28 15:00:05.159373', 'Sending message to (13128980321): gfff');
INSERT INTO "events" VALUES('8cfa4e1d-6328-4af7-9754-c86d9ca47e1d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 15:00:05.171050', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('dd9cec89-7ae1-401a-b34a-e48114d68b87', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 15:06:54.801864', 'Scheduled message: b260c0ad-0aad-4fbe-a02e-469e143107c4 (Unknown) for 2010-09-28 00:00:00.');
INSERT INTO "events" VALUES('ad74a313-3aad-4dd2-8d65-fb024c6c5c74', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 15:07:20.627673', 'Sending message to (+18477700637): Will you be able to meet with your home visitor tomorrow as previously scheduled?');
INSERT INTO "events" VALUES('fdc90e21-55cb-4bf9-857f-aee97ba89874', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 15:07:20.638487', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('919e636c-bcad-4e11-8d89-72ff962285f6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 15:07:37.029833', 'Received [+18477700637]: yes');
INSERT INTO "events" VALUES('c1c0bfd4-5f3c-497e-9aff-f26591b37177', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 15:07:37.053006', 'Set ''first_question'' = ''yes''.');
INSERT INTO "events" VALUES('78e30e28-3756-4635-9534-6c30aaa05b0a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 15:07:37.076919', 'Sending message to (+18477700637): Thanks for letting us know. Your response has been forwarded to your visitor.');
INSERT INTO "events" VALUES('65238480-35a8-4af6-a233-de3e442b2bdd', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:07:37.095115', 'Sending message to ((312) 339-6771): Received reminder response from #1919191919...');
INSERT INTO "events" VALUES('2cc1579a-019c-4528-bffc-0e987823825f', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:07:37.112434', 'Sending message to ((312) 339-6771): Will you be able to meet with your home visitor tomorrow as previously scheduled?');
INSERT INTO "events" VALUES('9fedf058-7ff0-4296-ac7e-fb8944fa96ff', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:07:37.129867', 'Sending message to ((312) 339-6771): #1919191919 response:');
INSERT INTO "events" VALUES('d9f4d318-3a0c-41c8-9765-1f6f89f212f2', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:07:37.148800', 'Sending message to ((312) 339-6771): yes');
INSERT INTO "events" VALUES('22384fd8-4f98-42ff-b5e5-0f82918fd707', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 15:07:37.160953', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('ba310920-dd29-48f3-aa68-380ab7fc2f2c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'schedule', '2010-09-28 15:11:35.170049', 'Scheduled message: b260c0ad-0aad-4fbe-a02e-469e143107c4 (Unknown) for 2010-09-28 15:15:00.');
INSERT INTO "events" VALUES('17fa7a94-0426-412f-b46d-028870f73187', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 15:15:20.627812', 'Sending message to (+18477700637): Will you be able to meet with your home visitor tomorrow as previously scheduled? If not, please give a brief explanation why.');
INSERT INTO "events" VALUES('4b7f1341-ff7e-460e-ba04-f8f421c99bea', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 15:15:20.638989', 'Started new dialog (Unknown Dialog) for (+18477700637).');
INSERT INTO "events" VALUES('45e1a1b7-44f2-495d-9511-e17133c1e90a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'receive', '2010-09-28 15:15:52.308901', 'Received [+18477700637]: no gotta eat pizza.');
INSERT INTO "events" VALUES('263e038e-d346-482c-ac5b-c99f957fa9ab', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'variable', '2010-09-28 15:15:52.341499', 'Set ''first_question'' = ''no gotta eat pizza.''.');
INSERT INTO "events" VALUES('a1976792-884c-447d-b988-ad5ec5b9f9ab', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-09-28 15:15:52.360815', 'Sending message to (+18477700637): Thanks for letting us know. Your response has been forwarded to your visitor.');
INSERT INTO "events" VALUES('cfad42fd-937d-465a-94a2-3a25febba7e4', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:15:52.377517', 'Sending message to ((312) 339-6771): Received reminder response from #1919191919...');
INSERT INTO "events" VALUES('1918bd6b-b425-473e-8eb6-608b4387c884', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:15:52.394683', 'Sending message to ((312) 339-6771): Will you be able to meet with your home visitor tomorrow as previously scheduled? If not, please give a brief explanation why.');
INSERT INTO "events" VALUES('f32bba89-2f7f-443a-9d33-2fa50e4f1a5d', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:15:52.413024', 'Sending message to ((312) 339-6771): #1919191919 response:');
INSERT INTO "events" VALUES('31e0ece2-6f92-4233-9c76-eb2975fca4b3', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'send', '2010-09-28 15:15:52.430634', 'Sending message to ((312) 339-6771): no gotta eat pizza.');
INSERT INTO "events" VALUES('0d4a9df2-926d-47f8-99a8-af68f87527ad', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'dialog', '2010-09-28 15:15:52.441432', 'Finished dialog for (+18477700637).');
INSERT INTO "events" VALUES('6c469a75-ab76-40d0-8a81-f9ccc489a635', 'Unknown (180)', 'receive', '2010-09-30 10:09:41.664851', 'Received [180]: free t-mobile msg 070: your address book service is now active. contacts can be managed by logging into my.t-mobile.com or from your handset.');
INSERT INTO "events" VALUES('38fc8408-037c-414b-80e5-3900021af3e2', 'Unknown (180)', 'send', '2010-09-30 10:09:41.720506', 'Sending message to (180): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('007ab3e6-16c3-440b-ae39-000bd6b62804', 'Unknown (456)', 'receive', '2010-10-06 15:31:41.162780', 'Received [456]: free t-mobile msg: we made the change you requested to your account effective oct 05 10. visit http://my.t-mobile.com for details on your current plan.');
INSERT INTO "events" VALUES('460a9e66-3b88-41c3-aedd-70b15d9f70ec', 'Unknown (456)', 'send', '2010-10-06 15:31:41.213048', 'Sending message to (456): To send us a message, begin it with "411". We''ll respond as soon as possible. Example: "411 When is my next visit?"');
INSERT INTO "events" VALUES('29001029-d813-4b82-8938-0117599c4f83', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'schedule', '2010-10-08 11:27:55.964147', 'Scheduled message: a99a155d-29be-4d3f-963d-95752c0204f0 (Unknown) for 2010-10-08 11:24:00.');
INSERT INTO "events" VALUES('e7aab231-7af0-460c-8679-ec48ea8bd31b', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-10-08 11:28:03.021854', 'Sending message to (+18474092757): Storytelling & reading books to baby are good ways to spark ur baby''s imagination. When reading take time to show the pictures to ur baby & REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('3056ce5e-c190-4c24-a42a-f17c65858fb5', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'dialog', '2010-10-08 11:28:03.033621', 'Started new dialog (Unknown Dialog) for (+18474092757).');
INSERT INTO "events" VALUES('0df906e6-329e-40c7-a19d-d6dcb54ed527', '80a9e20c-7bc0-4330-80cf-71754d03da78', 'schedule', '2010-10-08 11:29:48.760297', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:43:00.');
INSERT INTO "events" VALUES('60e481eb-7ed3-4901-8916-bdac971dc497', 'c487f669-a8e4-446c-8d24-3b2caeac56cb', 'schedule', '2010-10-08 11:29:48.817789', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:45:00.');
INSERT INTO "events" VALUES('cb0ff5d7-3d07-469c-990e-c9a10f39b221', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', 'schedule', '2010-10-08 11:29:48.902078', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:47:00.');
INSERT INTO "events" VALUES('5d2c01bd-e492-499e-9509-d47c34a31d11', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', 'schedule', '2010-10-08 11:29:48.958872', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:49:00.');
INSERT INTO "events" VALUES('d2c01133-43c9-4a69-98ed-30f0a8c357ff', '4eef861d-998b-4ef3-bca9-3d118978cb9f', 'schedule', '2010-10-08 11:29:49.013685', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:51:00.');
INSERT INTO "events" VALUES('64e276e2-339a-4c05-b1a1-c316a4f36054', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', 'schedule', '2010-10-08 11:29:49.069476', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:53:00.');
INSERT INTO "events" VALUES('f755f623-50f4-4562-be88-976492f5435d', '0a981c16-3c23-4399-b22a-9a42a945a62f', 'schedule', '2010-10-08 11:29:49.125037', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:55:00.');
INSERT INTO "events" VALUES('37040d47-c4a6-4824-86f1-a58afb3afabd', '4ef177b6-358e-44cc-b493-2e3db504beeb', 'schedule', '2010-10-08 11:29:49.178426', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:57:00.');
INSERT INTO "events" VALUES('d0a7eb67-5ced-4dd5-80c1-c86ade3f7bc3', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', 'schedule', '2010-10-08 11:29:49.236177', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 00:59:00.');
INSERT INTO "events" VALUES('fe5fc6c5-217f-48dd-b19c-74cb10ec339c', '74287e79-e01c-4170-ac84-94b265775cf3', 'schedule', '2010-10-08 11:29:49.291514', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 01:01:00.');
INSERT INTO "events" VALUES('bfa383e9-3d08-46b0-b516-73f68b45efd8', '76059dcc-66dc-4131-93c7-c35eb40c3cd3', 'schedule', '2010-10-08 11:29:49.349485', 'Scheduled message: 5c2aaee7-3673-4cb2-baca-34db619ccf78 (Unknown) for 2010-10-09 01:03:00.');
INSERT INTO "events" VALUES('eb94ffcf-3559-44a2-bb71-a3e90addb2a6', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'receive', '2010-10-08 11:32:12.710443', 'Received [+18474092757]: 1');
INSERT INTO "events" VALUES('b6a854a0-2dc6-4937-a0eb-3e0bc1c32dd5', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'variable', '2010-10-08 11:32:12.736208', 'Set ''Parenting Tip:first_tip'' = ''1''.');
INSERT INTO "events" VALUES('1615a294-4767-4ab5-9d87-d15ce63e2a05', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-10-08 11:32:12.780622', 'Sending message to (+18474092757): & name the objects in the pictures. When storytelling, try acting out parts of the story & use baby''s name for the main character in the story. REPLY 1 FOR MORE');
INSERT INTO "events" VALUES('1171dd17-b3e9-489e-87cb-8d6a36839b6b', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'receive', '2010-10-12 09:25:18.562153', 'Received [456]: free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('3f4a25d2-57d1-4a3c-88a2-20ef0a17c3c6', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'send', '2010-10-12 09:25:18.606764', 'Sent 411 response to (456).');
INSERT INTO "events" VALUES('2b85f7eb-6750-444d-abe9-5608bd1c8bef', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-10-12 09:25:18.658216', 'Sending message to ((847) 770-0637): Incoming 411 from 456:');
INSERT INTO "events" VALUES('dc25c3ae-7ed0-4363-ad21-dd5f9925e367', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', 'send', '2010-10-12 09:25:18.675249', 'Sending message to ((847) 770-0637): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('60ce55d9-7515-4442-8b96-557c402daab5', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'send', '2010-10-12 09:25:18.716179', 'Forwarded 411 message from (456): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('5f8cdd37-4ee1-4c8f-9b35-1e819f45726f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-10-12 09:25:18.755611', 'Sending message to (847-409-2757): Incoming 411 from 456:');
INSERT INTO "events" VALUES('15656275-774c-4390-8063-ef4e66d3b7b6', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', 'send', '2010-10-12 09:25:18.789223', 'Sending message to (847-409-2757): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('5b6f4a05-25b6-49c4-8eca-efab19045f23', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'send', '2010-10-12 09:25:18.800640', 'Forwarded 411 message from (456): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('f227513d-6e10-4760-b7e1-b6f8ef9fe8e7', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-10-12 09:25:18.860509', 'Sending message to (773-960-8723): Incoming 411 from 456:');
INSERT INTO "events" VALUES('48e925a5-c13b-4d74-bbbf-85f7839ad0aa', 'ae5916c0-df49-4902-966c-747817c517e5', 'send', '2010-10-12 09:25:18.877706', 'Sending message to (773-960-8723): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('5f725451-4a63-4edf-9de0-03672210486c', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'send', '2010-10-12 09:25:18.888652', 'Forwarded 411 message from (456): free t-mobile message: thank you for your online payment. $92.26 paid on oct 12. submitted by 847-770-0637. confirmation #056497.');
INSERT INTO "events" VALUES('74b2ae08-429e-4878-a300-5f3a117e0972', '81c93fb3-16f6-4e98-add8-c0767fcd81f5', 'send', '2010-10-12 09:25:18.906564', 'Sending message to (456): Your message has been received. We will respond shortly.');
CREATE TABLE variables (
	"Id" VARCHAR(36) NOT NULL, 
	"Participant" VARCHAR(36), 
	"Date" DATETIME, 
	"Key" VARCHAR(4096), 
	"Value" VARCHAR(4096), 
	PRIMARY KEY ("Id")
);
INSERT INTO "variables" VALUES('db3789ee-907b-4244-8dbd-ef9bc646782e', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 01:36:42.364401', 'Conversation Turn-Taking -- 1', '1');
INSERT INTO "variables" VALUES('37285e65-9216-4c5d-b565-ff014aea9adb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 01:37:21.840665', 'Conversation Turn-Taking -- 2', '1');
INSERT INTO "variables" VALUES('f7f98f01-3fcc-4f79-8dcd-2956d7b42651', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:13:15.049835', 'one', '2');
INSERT INTO "variables" VALUES('92769c52-5228-45eb-bf05-24456cc85742', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:16:30.825316', 'one', '1');
INSERT INTO "variables" VALUES('4c8f7bf9-0d38-49bf-9f28-62f44d05e8d1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:16:44.474675', 'two', '2');
INSERT INTO "variables" VALUES('707c55bb-b480-4f7d-b41b-6d40709aa674', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:18:23.349018', 'one', '1');
INSERT INTO "variables" VALUES('e6eda4d2-7482-4924-b824-675a22582ede', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:18:58.889838', 'two', '1');
INSERT INTO "variables" VALUES('fbdc0bdb-2508-4c39-a086-2a80bda1fb11', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:21:07.518406', 'Motor Followup:question', '1');
INSERT INTO "variables" VALUES('1e3098a8-77df-417d-a7c1-94d6ae19bc93', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 02:31:15.684229', 'one', '2');
INSERT INTO "variables" VALUES('9b5f82e6-5644-4130-a971-e0fa912f553f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:08:49.174496', 'first_tip', '1');
INSERT INTO "variables" VALUES('b5800a53-3473-498a-a396-22df43eb055c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:11:35.877997', 'first:first_tip', '1');
INSERT INTO "variables" VALUES('87a07871-5338-4c28-a843-fc90c4f44fb6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:12:03.656913', 'second:second_tip', '1');
INSERT INTO "variables" VALUES('5971608e-35e8-42e4-bd0e-124533bcf4db', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:18:50.310856', 'first:Baby Motor:first_tip', '1');
INSERT INTO "variables" VALUES('afce7f06-e6f2-4f6b-ac5d-cf01e1ece674', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:19:19.872609', 'second:Baby Motor:second_tip', '1');
INSERT INTO "variables" VALUES('bf90e448-7cff-4707-a59f-47ba12f3c916', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:20:59.998306', 'Baby Motor:first_tip', '1');
INSERT INTO "variables" VALUES('cbe9ad87-4687-4143-a3a0-6d05236fce22', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:22:02.771299', 'Baby Motor:second_tip', '3');
INSERT INTO "variables" VALUES('b2c4672d-0d53-48d5-8d0e-5c78378f46d7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:26:48.373301', 'Conversation Turn-Taking:first_tip', '1');
INSERT INTO "variables" VALUES('4499d4c5-14f7-481f-bd55-e5634f8ffb51', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:27:02.469975', 'Conversation Turn-Taking:second_tip', '2');
INSERT INTO "variables" VALUES('a0ec7b70-1cc1-433a-8ede-869f56efc739', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:33:06.097913', 'Conversation Turn-Taking:first_tip', '1');
INSERT INTO "variables" VALUES('3f1b2444-6115-4864-8526-9e6e35c95625', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:37:22.080425', 'Conversation Turn-Taking:first_tip', '1');
INSERT INTO "variables" VALUES('97ea7779-77f8-46ed-afa5-b6bc98db7456', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:37:42.402031', 'Conversation Turn-Taking:second_tip', '1');
INSERT INTO "variables" VALUES('1201d2ea-5e76-4fde-95f2-db02f08931ba', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:40:22.913817', '', '1');
INSERT INTO "variables" VALUES('0151d601-4141-4753-b815-eb3af6829311', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:42:38.927173', 'Behavior:prompt', '1');
INSERT INTO "variables" VALUES('ca0f8e44-be29-4cb3-9e01-541f195ea310', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:44:57.478241', 'Motor Followup:first_question', '1');
INSERT INTO "variables" VALUES('8e6d6f68-4ed5-4d3d-a481-38bc0845f5c2', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:45:30.104581', 'Motor Followup:second_question', '1');
INSERT INTO "variables" VALUES('978fa4e2-62b0-4c9d-b0aa-aba3abededb7', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:46:21.435444', 'Motor Followup:first_question', '1');
INSERT INTO "variables" VALUES('22f30180-72e1-4f79-be04-dc8e31d9b9f6', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:46:53.559452', 'Motor Followup:second_question', '2');
INSERT INTO "variables" VALUES('6c790a44-e739-4a59-9e7a-532b5c2b179c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-22 08:50:21.413567', 'Motor Followup:first_question', '2');
INSERT INTO "variables" VALUES('53965a6e-c1d6-4819-8fa9-2a2fcc2f975c', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', '2010-09-22 19:19:42.952923', 'Bath Talk:prompt', '1');
INSERT INTO "variables" VALUES('b23a9741-6163-434e-8fed-9581d94f57e5', '0a981c16-3c23-4399-b22a-9a42a945a62f', '2010-09-22 19:30:38.268841', 'Bath Talk:prompt', '1');
INSERT INTO "variables" VALUES('017c358b-7a70-4e8b-9373-4e188f4526b3', '4ef177b6-358e-44cc-b493-2e3db504beeb', '2010-09-22 19:46:35.829680', 'Bath Talk:prompt', '1');
INSERT INTO "variables" VALUES('9cdfed51-6fe3-43c0-94e9-c11b17dfad52', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-22 21:26:21.526876', 'Bath Talk:prompt', '1');
INSERT INTO "variables" VALUES('b0929958-4e8b-4570-8e31-f3322360dd37', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 06:40:54.723752', 'Bath Talk:prompt', '1');
INSERT INTO "variables" VALUES('f7c4c602-679f-48cc-ad11-e77cf72b9f7a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:00:52.092957', 'ready', '1');
INSERT INTO "variables" VALUES('0e6f8e46-3054-4700-bbe8-137efc150208', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:01:18.954294', 'continue', '1');
INSERT INTO "variables" VALUES('d3de0677-f79c-490f-a0d7-efd6848f2799', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:02:05.730259', 'blame', '1');
INSERT INTO "variables" VALUES('409ad5ef-0a70-4684-a0fc-a086e62bb429', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:02:19.211941', 'anxious', '4');
INSERT INTO "variables" VALUES('1b46b397-d8ed-4bd0-8e35-49e2eda5c747', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:02:50.090096', 'afraid', '3');
INSERT INTO "variables" VALUES('977bf1f5-a080-41d5-815e-875bf9f5dc8b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:17:05.435261', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('73e84d78-ab5d-4f61-a9a0-92e16f0d7019', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:17:26.670169', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('81b634fc-ce85-4467-b7e8-3f9a4b864c8f', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:17:52.202058', 'epnds:blame', '3');
INSERT INTO "variables" VALUES('e922d352-114a-45a8-85bc-58abbb62692a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:18:05.803770', 'epnds:anxious', '2');
INSERT INTO "variables" VALUES('8d1d3332-686e-4d27-8ec3-2dcb29109fff', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 08:18:20.301321', 'epnds:afraid', '4');
INSERT INTO "variables" VALUES('b99c44a3-86a9-4660-afc9-04bd2ad32214', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', '2010-09-23 10:39:20.272771', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('2258228a-6074-4060-86c7-abc6b9ca04b3', 'a4067eec-6c7e-44a7-90a5-9e8bc93a358e', '2010-09-23 10:41:15.598377', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('53201f54-966f-4a37-af62-e057d3d30af9', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', '2010-09-23 10:47:15.124498', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('21349b70-878b-4d22-8980-3594af019799', '01be68a4-57b9-4b82-8d1b-8732ffdd95df', '2010-09-23 10:48:07.633267', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('6d50378a-09dc-465e-91fe-0d4e9e2a3f70', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:53:25.371792', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('ddd319ae-1953-47a2-9fd2-36f31d79be5b', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:53:49.501000', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('8e8c5fdb-1fa9-4457-82fb-8a7379c7c6e8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:54:13.377402', 'epnds:blame', '4');
INSERT INTO "variables" VALUES('f68fdc6d-eee4-41ba-ad88-94b1b6de5dfe', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:54:28.474843', 'epnds:anxious', '4');
INSERT INTO "variables" VALUES('38987087-c151-497a-a313-cda0ed933cc1', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-23 10:54:43.226295', 'epnds:afraid', '4');
INSERT INTO "variables" VALUES('c6c100e8-b595-43b3-837d-6681a2c63adc', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:55:25.430155', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('6c8c253e-f365-40ec-8e93-2d320511f595', '74287e79-e01c-4170-ac84-94b265775cf3', '2010-09-23 10:56:39.004481', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('225b59ed-07fd-4ce6-8751-a7aa47f595ab', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:58:21.265603', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('23767958-93f0-4cbd-9d0f-76b045592d24', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:58:41.410298', 'epnds:blame', '4');
INSERT INTO "variables" VALUES('5b004be6-3d49-4baf-a05c-f0d8938edb80', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:58:59.520127', 'epnds:anxious', '4');
INSERT INTO "variables" VALUES('fbf91a31-871a-4eb1-a035-3baec6a8b2b3', '2ec6dec7-fbbb-41e0-bfae-2f45bc3cf2e5', '2010-09-23 10:59:17.365937', 'epnds:afraid', '2');
INSERT INTO "variables" VALUES('5ae91342-4b88-4e08-8ecf-3191cf648270', '74287e79-e01c-4170-ac84-94b265775cf3', '2010-09-23 10:59:31.314376', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('db811e54-9a16-4446-9058-4ddbf0cf44bc', '4eef861d-998b-4ef3-bca9-3d118978cb9f', '2010-09-23 11:02:11.202753', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('993546be-7903-45fe-9082-5bbafe3e8100', '74287e79-e01c-4170-ac84-94b265775cf3', '2010-09-23 11:02:17.413730', 'epnds:blame', '3');
INSERT INTO "variables" VALUES('0702af72-ccfe-4820-b841-e46a150b8f97', '4eef861d-998b-4ef3-bca9-3d118978cb9f', '2010-09-23 11:03:51.791438', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('e4e7b00e-4257-4f34-a824-c418a95e5f3b', '74287e79-e01c-4170-ac84-94b265775cf3', '2010-09-23 11:05:05.357012', 'epnds:anxious', '2');
INSERT INTO "variables" VALUES('12c2d929-1088-4a34-92bb-b65e7bcca162', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 12:07:21.081862', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('ad2bf0cf-e8f5-4f5d-9fe5-10f792a03d8c', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 12:08:04.027879', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('1a7f7150-4088-4351-b7b3-0a96d518cd57', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 12:09:14.560582', 'epnds:blame', '3');
INSERT INTO "variables" VALUES('c5d1a749-1122-4392-a4ae-b622ba785d4f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 12:10:05.463264', 'epnds:anxious', '1');
INSERT INTO "variables" VALUES('5c8ef2d0-1c87-42e0-8fbb-c0c2ecf9e11f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-09-23 12:10:41.634139', 'epnds:afraid', '3');
INSERT INTO "variables" VALUES('43d2fef1-0634-4f74-944e-9b23f512c1ba', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-24 03:05:06.473256', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('4c7b0ff3-6589-4f81-86ca-9543eb8397ac', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-24 03:05:38.555285', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('44107aa0-3c7f-407b-933f-21d108a22b76', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-24 03:06:08.148830', 'epnds:blame', '2');
INSERT INTO "variables" VALUES('718da494-e05b-4f4a-8215-f3c33ccbc768', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-24 03:06:49.363996', 'epnds:anxious', '3');
INSERT INTO "variables" VALUES('724053be-4641-4a3f-bd36-c97e53051d7a', '26f72f04-d12c-4ccc-828a-9b3b9d69b072', '2010-09-24 03:07:37.651517', 'epnds:afraid', '4');
INSERT INTO "variables" VALUES('28e6ce85-a2ff-4c45-9420-70b3c86349ea', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-24 11:00:46.811451', 'epnds:ready', '1');
INSERT INTO "variables" VALUES('7781e912-f56b-4f25-9dd3-d43827c5fb08', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-24 11:02:12.626970', 'epnds:continue', '1');
INSERT INTO "variables" VALUES('17a3ccaa-8457-4f2e-ac02-a4c2fb51b52d', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-24 11:05:01.691550', 'epnds:blame', '1');
INSERT INTO "variables" VALUES('1b749e6f-b64b-4312-b45e-0f586858fb21', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-24 11:07:25.050914', 'epnds:anxious', '4');
INSERT INTO "variables" VALUES('bfd91b0e-60e6-453b-84fa-c1235f642367', 'ae5916c0-df49-4902-966c-747817c517e5', '2010-09-24 11:07:54.289511', 'epnds:afraid', '4');
INSERT INTO "variables" VALUES('0c279773-d39e-4618-b45a-346075b24edb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:03:24.198488', 'first_question', 'sure');
INSERT INTO "variables" VALUES('7b31812b-e2fd-4f91-ab96-2a80487fe90c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:07:13.112853', 'first_question', 'ffffhg');
INSERT INTO "variables" VALUES('fc9cb805-64d4-46b2-be14-6ef72a06b15a', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:11:51.142382', 'first_question', 'idtyh');
INSERT INTO "variables" VALUES('76260c54-5f7b-49f2-8dcf-bd71e6257736', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:15:41.529767', 'first_question', 'vbcchchfhj');
INSERT INTO "variables" VALUES('39e25dbe-4828-43bf-9990-f561c5cfa839', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:22:29.693169', 'first_question', 'offer');
INSERT INTO "variables" VALUES('45f2077a-4ccd-4f03-be6b-595b4cd73759', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:37:07.977692', 'first_question', 'fffhdhhgg');
INSERT INTO "variables" VALUES('3cf87cac-9ae6-47f1-be0f-7d2053fc2c13', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:39:07.991224', 'first_question', 'jhfddhgfghj');
INSERT INTO "variables" VALUES('d3858344-6e00-4549-8f28-56839c5244dd', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:41:23.749909', 'first_question', 'it sure does');
INSERT INTO "variables" VALUES('e2064c81-07be-4586-b127-0b172a4f9f8c', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:48:54.294748', 'first_question', 'xgg');
INSERT INTO "variables" VALUES('fc8d87b6-ee3a-4490-9269-71bc6b2772e8', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:53:00.046996', 'first_question', 'ffffhg');
INSERT INTO "variables" VALUES('e51f0162-c4c5-4a94-aca4-36cd8898e875', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 10:54:38.561406', 'first_question', 'iffy');
INSERT INTO "variables" VALUES('7e94b010-71f0-4f18-8852-268c15493baa', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 15:00:05.031470', 'first_question', 'gfff');
INSERT INTO "variables" VALUES('daaa5b7f-9353-459b-b984-cc758377aaeb', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 15:07:37.044294', 'first_question', 'yes');
INSERT INTO "variables" VALUES('e10cf842-7fd5-4a96-b559-dab6c3153c3d', '13a60dc6-2de5-4d4e-a0dc-352af4457e09', '2010-09-28 15:15:52.333043', 'first_question', 'no gotta eat pizza.');
INSERT INTO "variables" VALUES('cb4fa157-e660-4f34-b33e-36b19c3ae41f', '2c2a70bf-d808-4291-99d0-3c2496cf77e5', '2010-10-08 11:32:12.726771', 'Parenting Tip:first_tip', '1');
CREATE TABLE reminders (
	"Id" VARCHAR(36) NOT NULL, 
	"Name" VARCHAR(256), 
	"Question" VARCHAR(256), 
	"Positive" VARCHAR(256), 
	"Negative" VARCHAR(256), 
	PRIMARY KEY ("Id")
);
INSERT INTO "reminders" VALUES('b260c0ad-0aad-4fbe-a02e-469e143107c4', 'Tomorrow', 'Will you be able to meet with your home visitor tomorrow as previously scheduled? If not, please give a brief explanation why.', 'Thanks for the confirmation. I''ll let your visitor know.', 'Thanks for letting us know. Can you provide a short explanation that I can pass on to your visitor?');
COMMIT;
