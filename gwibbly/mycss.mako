.likes {
  background: url(favorite.png) left no-repeat;
  padding-left: 20px;
  min-height: 16px;
}

.comments p {
  background: url(comment.png) left top no-repeat;
  padding-left: 20px;
  min-height: 16px;
}

.thumbnails img {
  max-width: 175px;
}

.thumbnails {
  margin-top: 5px;
}

.location {
  background: url(${resources.icon("gnome-globe")}) left no-repeat;
  padding-left: 20px;
  min-height: 16px;
}

.viewmore p {
  text-align: center;
}


/* My Sweet CSS3 Bubbles */
.msgpop {
  padding-bottom:10px;
  background-color: #f4f4f4;
  background: -webkit-gradient(linear, left top, left bottom, from(#c2e1ff), to(#90c9fc), color-stop(0.3, #6bb3fb), color-stop(0.31, #4ca5fe), color-stop(0.7, #61aeff));
  border-radius:10px;
  padding:5px;
  margin:5px 5px 4px 5px;
  font-size:12px;
  min-height:48px;
  border-top:1px solid #bbb;
  border-left:1px solid #aeb1b8;
  border-right:1px solid #aeb1b8;
  border-bottom:1px solid #ddd;
  -box-shadow:1px 1px 5px #555;
  color:#000;
}
#rounded_orange {
    color:#9f3400;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #f6f9e6), color-stop(0.3, #f9f5e2), color-stop(0.7, #f9f5e2));
    -webkit-box-shadow: 1px 1px 5px #dfd4a7;
}
#rounded_red {
    color:#843c46;
    background-color:#f7e4e6;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #faeced), color-stop(0.3, #f7e4e6), color-stop(0.7, #f7e4e6));
    -webkit-box-shadow: 1px 1px 5px #e6becf;
}
#rounded_green {
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #ecffee), color-stop(0.3, #ecffee), color-stop(0.7, #ecffee));
    color:#00800c;
}
cite.rounded {
    padding:6px 10px 10px 10px;
    background: url(tip3.gif) top 20px no-repeat;
    color:#555;
    text-shadow: 1px 1px 1px #fff;
}

.reply cite.rounded {
  background: url(tip2.gif) top 20px no-repeat;
}
.unread .rounded {
  background: url(tip.gif) top 20px no-repeat;
}
.reply .msgpop {
  border-bottom:none;
}
