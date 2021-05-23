<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReservationDAO"%>
<%@page import="vo.UserReservationVO"%>
<html>
<head>
<meta charset='utf-8' />
<link href='../fullcalendar.css' rel='stylesheet' />
<link href='../fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='../lib/moment.min.js'></script>
<script src='../lib/jquery.min.js'></script>
<script src='../fullcalendar.min.js'></script>
<%
String id = (String)session.getAttribute("theID");
UserReservationVO vo = new UserReservationVO();
ReservationDAO dao = new ReservationDAO();
ArrayList<UserReservationVO> list = dao.selectAll("a");
for(UserReservationVO ur : list) {
	/* out.println(	ur.getStartDate()); */
	String str = ur.getStartDate();
	String[] parse = str.split(" ");
}

%>
<script>

	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2015-02-12',
			businessHours: true, // display business hours
			editable: true,
			events: [
				{
					title: 'Business Lunch',
					start: '2015-02-03T13:00:00',
					end: '2015-02-04T13:00:00',
					constraint: 'businessHours'
				},
				{
					title: 'Meeting',
					start: '2015-02-13T11:00:00',
					constraint: 'availableForMeeting', // defined below
					color: '#257e4a'
				},
				{
					title: 'Conference',
					start: '2015-02-18',
					end: '2015-02-20'
				},
				{
					title: 'Party',
					start: '2015-02-28T20:00:00'
				}
			]
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
