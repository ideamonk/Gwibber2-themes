body {
  word-break: break-word;
  font-family: Sans-serif;
  margin: 4px;
  font-size:12px;
}

a {
  color: #;
  outline: none;
}

.time a { color: ${theme["bg_selected"].darker(.65).hex};}
a:hover { text-decoration: underline; }


td { vertical-align: top; }

p { line-height: 125% }

.message {
  text-align:left;
}

.content {
  margin-top: 0px;
  color: ${theme['fg'].hex};
}

.title {
  font-size: 105%;
  font-weight: bold;
}

.time a {
  text-decoration: none;
  font-size: 80%;
}

.imgbox {
  width: 48px;
  height: 48px;
  margin-right: 5px;
  -webkit-background-size: 100% 100%;
  background-image: url('');
  background-repeat: no-repeat;
  -webkit-border-radius:5px;
  border-right:1px solid #333;
border-bottom:1px solid #333;
  /*-webkit-box-reflect:below 0px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(0.6, transparent), to(rgba(0,0,0, 0.6)));*/
}

.inlinenick {
  text-decoration: none;
  font-weight: bold;       
}

.messages h1 {
  text-align: center;
}

.replybutton {
  float: right;
  display: none;
  margin: 1px 3px 5px 0px;
  position:relative;
  right:3px;
  bottom:10px;
}

.unread .msgpop{
  /*background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #f4f4f4), color-stop(0.3, #eee), color-stop(0.7, #eee));*/
  background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #e3e3e3), color-stop(0.2, #dedede), color-stop(0.8, #e5e5e5));
}

.reply .msgpop{
  background: -webkit-gradient(linear, left top, left bottom, from(#d7f7c8), to(#b4eb5c), color-stop(0.2, #afe992), color-stop(0.2, #b1ea94), color-stop(0.4, #8cdf56));
}

.private .msgpop{
    background-color:#f7e4e6;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff), color-stop(0.2, #faeced), color-stop(0.3, #f7e4e6), color-stop(0.7, #f7e4e6));
}

.dupes {
  display: none;
  margin-top: 10px;
}

.toggledupe {
  float: right;
}

.fold {
}

.fold a {
  text-decoration: none;
}

.accounts {
  border: 3px solid ${theme["bg_selected"].hex};
  -webkit-border-radius: 5px;
  color: ${theme["fg"].hex};
  vertical-align: middle;
  border-spacing: 0px;
  width: 100%;
}

.accounts a {
  text-decoration: none;
}

.accounts a:hover {
  text-decoration: underline;
}

.accounts td {
  padding: 5px;
  vertical-align: middle;
}

.accounts tr:nth-child(even) {
  background: ${theme["bg"].hex}
}

.accounts tr:nth-child(odd) {
  background: ${theme["bg"].darker(.90).hex};
}

.accounts tr:hover {
  background: -webkit-gradient(linear, left top, left bottom,
      from(${theme["bg_selected"].hex}),
      to(${theme["bg_selected"].darker(.90).hex}));
  color: ${theme["text_selected"].hex};
}

.accounts thead tr, .account_creation thead tr {
  background: -webkit-gradient(linear, left top, left bottom,
      from(${theme["bg_selected"].hex}),
      to(${theme["bg_selected"].darker(.80).hex})) !important;
  color: ${theme["text_selected"].hex};
  font-weight: bold;
}

.welcome {
  border: 3px solid ${theme["bg_selected"].hex};
  -webkit-border-radius: 5px;
  background: -webkit-gradient(linear, left top, left bottom,
      from(${theme["bg_selected"].hex}),
      to(${theme["bg_selected"].darker(.80).hex}));
  color: ${theme["text_selected"].hex};
  text-align: center;
  margin-bottom: 5px;
}

.content_box .header {
  background: -webkit-gradient(linear, left top, left bottom,
      from(${theme["bg_selected"].hex}),
      to(${theme["bg_selected"].darker(.80).hex})) !important;
  color: ${theme["text_selected"].hex};
  font-weight: bold;
  padding: 5px;
}

.content_box {
  border: 3px solid ${theme["bg_selected"].hex};
  -webkit-border-radius: 5px;
  color: ${theme["fg"].hex};
  vertical-align: middle;
  border-spacing: 0px;
  background: ${theme["bg"].hex};
}

.content_box .box_content {
  padding: 10px;
}

.account_creation .block {
  display: inline-block;
  padding: 5px;
  margin: 10px;
  text-align: center;
  border: 3px solid ${theme["bg"].hex};
  -webkit-border-radius: 5px;
}

.account_creation .block:hover {
  border: 3px solid ${theme["bg_selected"].hex};
  -webkit-border-radius: 5px;
  background: -webkit-gradient(linear, left top, left bottom,
      from(${theme["bg_selected"].hex}),
      to(${theme["bg_selected"].darker(.80).hex}));
  color: ${theme["text_selected"].hex};
}
