$(document).ready(function() {
  $('.project-link').on('click', function() {
    ga('send', 'event', 'project', $(this).attr('href'));
  });
});