<%namespace name="base" file="mybase.mako">
</%namespace>

<html>
  <head>
    <script src="jquery.js"></script>
    <style>
      <%include file="mytheme.css" /> 
    </style>
  </head>
  <body>
    <div class="welcome">
      <img style="float:right; padding: 5px;" src="${resources.get_ui_asset('gwibber.png')}" />
      <h2>Welcome to Gwibber</h2>
    </div>
    ${base.accounts_list(accounts)}
    <br />
    ${base.account_creation(accounts)}
    <br />
    % if message_store:
      ${base.latest_messages(message_store)}
    % endif
  </body>
</html>
