<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <style>
    .groupArea a{
    	font-size: 0.1em;
    	display:inline-block;
	}
	.fc-day-sat{ color:#0000FF; } 
    .fc-day-sun { color:#FF0000; } 
    </style>
    <link rel="stylesheet" href="resources/css/main.css?ver=1.0"/>
    <script src="resources/js/main.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: 'ko',
          googleCalendarApiKey: 'AIzaSyCE--Q2PjLaRU-E0DugFhsTVfclG8-1aKM',
          events: {
            googleCalendarId: '749mvklmkka7eqdao49namb5bs@group.calendar.google.com',
            className: 'gcal-event' // an option!
          },
          eventClick: function(info) {
			info.jsEvent.stopPropagation();
			info.jsEvent.preventDefault();
		}
        });
        calendar.render();
      });
      

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

