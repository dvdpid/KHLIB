<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet" href="resources/css/main.css"/>
    <script src="resources/js/main.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          googleCalendarApiKey: 'AIzaSyCE--Q2PjLaRU-E0DugFhsTVfclG8-1aKM',
          events: {
            googleCalendarId: '749mvklmkka7eqdao49namb5bs@group.calendar.google.com',
            className: 'gcal-event' // an option!
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

