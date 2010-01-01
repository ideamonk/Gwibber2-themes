<%namespace name="base" file="mybase.mako">
  <%def name="msgstyle(data)">
  </%def>
</%namespace>

<html>
  <head>
    <script src="jquery.js"></script>
    <script>
      $(document).ready(function() {
        $(".msgpop").hover(
          function() {$(this).find(".replybutton").fadeIn(100)},
          function() {$(this).find(".replybutton").hide(0)});

        $(".toggledupe").show(0).unbind().toggle(
          function() {$(this).parent().find(".dupes").show(100)},
          function() {$(this).parent().find(".dupes").hide(100)});
      });
    </script>
    <style>
      <%include file="mytheme.css" /> 
    </style>
  </head>
  <body>
    ${base.messages(message_store)}
  </body>
</html>
