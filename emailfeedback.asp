<%
'On error resume next
Dim ObjSendMail, mesg , objMailtext
mesg  = "<table width=400 border=1 bordercolor=006699 cellspacing=1 cellpadding=3><tr bgcolor=#006699> <td colspan=2 align=center><font color=#FFFFFF size=4>Seenu Sports Academy Feedback</font></td></tr>"
mesg = mesg + "<tr><td width=200>Contact Person </td> <td width=200>"&Request.Form("firstname") &"</td></tr>" 
mesg = mesg + "<tr><td>Contact Number </td> <td> "&Request.Form("telephone") &"</td></tr>" 
mesg = mesg + "<tr><td>City </td> <td> "&Request.Form("city") &"</td></tr>" 
mesg = mesg + "<tr><td>Comments  </td> <td> "&Request.Form("comments") &"</td></tr></table>" 

Set ObjSendMail = CreateObject("CDO.Message")
strSubject = "Seenu Sports Academy Feedback"

If request("chkf") = "SC174T43" then

ObjSendMail.From = Request.Form("email")
ObjSendMail.To = "info@seenusportsacademy.com"
ObjSendMail.Subject = strSubject
ObjSendMail.HTMLBody =  mesg

With ObjSendMail.Configuration.Fields


ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'Send the message using the network (SMTP over the network).
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="137.59.201.111"
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False 'Use SSL for the connection (True or False)
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
     
' If your server requires outgoing authentication uncomment the lines bleow and use a valid email address and password.
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic (clear-text) authentication
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="mail@markersspot.com"
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="Avail123#"
     
ObjSendMail.Configuration.Fields.Update

End With

ObjSendMail.Send

Set ObjSendMail = Nothing

      Response.redirect("../Customer/thanks.aspx")
End if		
%>