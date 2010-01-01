<%def name="map(lat, long, w=175, h=80, maptype='mobile')">
  <a href="http://maps.google.com/maps?q=${lat},${long}">
    <img src="http://maps.google.com/staticmap?zoom=12&size=${w}x${h}&maptype=${maptype}&markers=${lat},${long}" />
  </a>
</%def>

<%def name="profile_url(data)" filter="trim">
  % if "user_messages" in protocols[data.protocol]["features"]:
    gwibber:/user?acct=${data.account}&amp;name=${data.sender_nick}
  % else:
    ${data.profile_url}
  % endif
</%def>

<%def name="comment(data)">
  <p><a href="${data['profile_url']}">${data['sender']}</a>: ${data['text']}</p>
</%def>

<%def name="msgclass(data, classes=['unread', 'reply', 'private'])">
  <% return " ".join(i for i in classes \
    if hasattr(data, "is_" + i) and getattr(data, "is_" + i)) %>
</%def>

<%def name="msgstyle(data)" filter="trim">
</%def>

<%def name="geo_position(data)">
  <div class="position">
    % if hasattr(data, "location_name"):
      <p class="location">Posted from: ${data.location_name}</p>
    % endif
    ${self.map(*data.geo_position)}
  </div>
</%def>

<%def name="liked_by(data)">
  <p class="likes">${data.liked_by} user(s) liked this</p> 
</%def>

<%def name="comments(data)">
  <div class="comments">
    % for c in data.comments[-3:]:
      ${self.comment(c)}
    % endfor
  </div>
</%def>

<%def name="image(data)">
  <a href="${profile_url(data)}">
    <div class="imgbox" title="${data.sender_nick}" style="background-image: url(${data.image});"></div>
  </a>
</%def>

<%def name="thumbnails(data)">
  <div class="thumbnails">
    % for i in data.thumbnails:
      <a href="${i['href']}"><img src="${i['src']}" /></a>
    % endfor
  </div>
</%def>

<%def name="dupes(data)">
  % if len(data.dupes) > 0:
    <div class="dupes">
      % for d in data.dupes:
        ${self.message(d)}
      % endfor
    </div>
  % endif
</%def>

<%def name="buttons(data)">
  <div class="replybutton">
    <a href="gwibber:/menu?msg=${data.gwibber_path}"><img width="16px" src="${resources.icon('system-run')}" /></a> 
    <a href="gwibber:/reply?msg=${data.gwibber_path}"><img width="16px" src="${resources.icon('mail-reply-sender')}" /></a>
  </div>
</%def>

<%def name="extended_text(data)">
  <p class="text">${data.extended_text}</p>
</%def>

<%def name="fold(data, ops=['geo_position', 'liked_by', 'comments', 'extended_text', 'thumbnails'])">
  <div class="fold">
    % for o in ops:
      % if hasattr(data, o):
        ${getattr(self, o)(data)}
      % endif
    % endfor
  </div>
</%def>
  
<%def name="timestring(data)" filter="trim">
  <a href="gwibber:/read?msg=${data.gwibber_path}">${data.time_string}</a>
  % if hasattr(data, "source") and data.source:
    <a>${_("from")} ${data.source}</a>
  % endif
  % if hasattr(data, "reply_nick") and data.reply_nick:
    <a href="${data.reply_url}">${_("in reply to")} ${data.reply_nick}</a>
  % endif
</%def>

<%def name="sender(data)" filter="trim">
  ${data.sender if preferences["show_fullname_in_messages"] else data.sender_nick}
</%def>

<%def name="title(data)">
  <span class="title">${data.title if hasattr(data, "title") else sender(data)}</span>
</%def>

<%def name="sigil(data)">
  % if hasattr(data, "sigil"):
    <span class="sigil"><img src="${data.sigil}" /></span>
  % endif
</%def>

<%def name="content(data)">
  <p class="content">
    <span class="text">${data.html_string}</span>
  </p>
</%def>

<%def name="sidebar(data)">
  % if hasattr(data, "image") and data.image:
    ${self.image(data)}
  % endif
</%def>

<%def name="messagebox(data)">
  <div id="${data.gId}" style="${self.msgstyle(data)}" class="message ${self.msgclass(data)}">
    ${caller.body()}
  </div>
</%def>

<%def name="user_header_message(data)">
  <%call expr="messagebox(data)">
    <center>
      <p class="content">
        <span class="title">${data.sender}</span><br />
        % if hasattr(data, "sender_followers_count"):
          <span class="text">${data.sender_followers_count} followers</span><br />
          <span class="text">${data.sender_location}</span><br />
        % endif
        <span class="text"><a href="${data.external_profile_url}">${data.external_profile_url}</a></span>
      </p>
    </center>
  </%call>
</%def>

<%def name="toggledupe(data)">
  % if len(data.dupes) > 0:
    <div class="toggledupe"><img src="${resources.icon('list-add')}" /></div>
  % endif
</%def>

<%def name="message(data)">
  <%call expr="messagebox(data)">
    ${toggledupe(data)}
	<div class='msgpop'>
	  <div style='float:left;'>${self.sidebar(data)}</div>
	  <div>
	    ${self.content(data)}
	    ${self.fold(data)}
	  </div>
	  ${self.buttons(data)}	
	  ${self.dupes(data)}
	</div>
	<cite class='rounded'>${title(data)}<span class="time"> (${timestring(data)})</span></cite><br />
  </%call>
</%def>

<%def name="messages(data)">
  <div class="header">
  </div>
  <div class="messages">
    % for m in data:
      % if hasattr(m, "is_user_header"):
        ${self.user_header_message(m)}
      % else:
        % if not m.is_duplicate:
          ${self.message(m)}
        % endif
      % endif
    % endfor
  </div>
  % if count and count < total:
    <div class="viewmore">
      <p><a href="gwibber:/more">View More Messages</a></p>
    </div>
  % endif
</%def>

<%def name="accounts_list(accounts)">
  <table class="accounts">
    <thead><tr><td colspan="100%">Your Accounts</td></tr></thead>
    % for a in accounts:
      <tr>
        <td>${a["username"]}</td>
        <td>
          <img src="${resources.get_ui_asset('icons/%s.png' % a['protocol'])}" />
          ${protocols[a["protocol"]]["name"]}
        </td>
        <td>
          <a href="gwibber:/account?id=${a['id']}"><img src="${resources.icon('gtk-edit')}" /></a>
          <a href="gwibber:/account?id=${a['id']}&action=delete"><img src="${resources.icon('gtk-delete')}" /></a>
        </td>
      </tr>
    % endfor
  </table>
</%def>

<%def name="account_creation(accounts)">
  <div class="content_box account_creation">
    <div class="header">Create New Account</div>
    % for p in ["twitter", "identica", "facebook", "friendfeed"]:
      <div class="block">
        <a href="gwibber:/account?id=${p}&action=create"><img src="${resources.get_ui_asset('icons/32x32/%s.png' % p)}" /></a>
        <br />${protocols[p]["name"]}
      </div>
    % endfor
  </div>
</%def>

<%def name="latest_messages(messages)">
  <div class="content_box">
    <div class="header">Latest Replies</div>
    <div class="box_content">
      <hr />
      % for m in messages:
        <p>
          <b>${m.sender}</b> <small>(${m.time_string})</small><br />
          ${m.html_string}
        </p>
        <hr />
      % endfor
    </div>
  </div>
</%def>

<%def name="errors(data)">
  % for e in data:
    <div class="content_box">
      <div class="header">
        <img style="float: left; padding-right: 5px;" src="${resources.icon('gtk-dialog-warning', use_theme=False)}" />
        ${e['error']}
        <div class="toggledupe"><img src="${resources.icon('list-add')}" /></div>
      </div>
      <div class="box_content">
        <code>${e['op']['opname']}</code> failed with <code>${e['type']}</code> on ${e['op']['protocol']} ${e['time_string']}
        <div class="dupes">
          <pre style="font-size: small">
            ${e["traceback"]}
          </pre>
        </div>
      </div>
    </div>
    <br />
  % endfor
</%def>


