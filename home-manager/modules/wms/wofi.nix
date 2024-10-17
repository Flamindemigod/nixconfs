{
	programs.wofi = {
		enable = true;
		settings = {
				width=900;
				height=500;
				location="center";
				show="drun";
				prompt="Search...";
				filter_rate=100;
				allow_markup=true;
				no_actions=true;
				halign="fill";
				orientation="vertical";
				content_halign="fill";
				insensitive=true;
				allow_images=true;
				image_size=40;
				gtk_dark=true;
		};
#		style=
#		''
#window {
#  margin: 0px;
#  border: 5px solid #111019;
#  background-color: rgba(11, 10, 16, 0.9);
#  border-radius: 15px;
#}
#
##input {
#  all: unset;
#  min-height: 36px;
#  padding: 4px 10px;
#  margin: 4px;
#  border: none;
#  color: #e2e0ec;
#  font-weight: bold;
#  background-color: #161420;
#  outline: none;
#  border-radius: 15px;
#  margin: 10px;
#  margin-bottom: 2px;
#}
#
##inner-box {
#  margin: 4px;
#  padding: 10px;
#  font-weight: bold;
#  border-radius: 15px;
#}
#
##outer-box {
#  margin: 0px;
#  padding: 3px;
#  border: none;
#  border-radius: 15px;
#  border: 5px solid #111019;
#}
#
##scroll {
#  margin-top: 5px;
#  border: none;
#  border-radius: 15px;
#  margin-bottom: 5px;
#}
#
##text:selected {
#  color: #f1f0f5;
#  margin: 0px 0px;
#  border: none;
#  border-radius: 15px;
#}
#
##entry {
#  margin: 0px 0px;
#  border: none;
#  border-radius: 15px;
#  background-color: transparent;
#}
#
##entry:selected {
#  margin: 0px 0px;
#  border: none;
#  border-radius: 15px;
#  background: linear-gradient(90deg, #0D1560 0%, #9BBEF4 100%);
#}
#		'';
	};
}