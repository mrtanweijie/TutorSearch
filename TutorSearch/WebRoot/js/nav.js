// 导航栏配置文件
var outlookbar=new outlook();
var t;


t=outlookbar.addtitle('基本信息','管理首页',1);

outlookbar.additem('我的资料',t,'/TutorSearch/Admin/');
outlookbar.additem('完善资料',t,'/TutorSearch/admin/addmyinfo.jsp');
outlookbar.additem('密码修改',t,'/TutorSearch/admin/changepwd.jsp');

t=outlookbar.addtitle('用户反馈','管理首页',1);
outlookbar.additem('反馈信息',t,'/TutorSearch/admin/adduser.jsp');

t=outlookbar.addtitle('添加用户','用户管理',1);
outlookbar.additem('添加用户',t,'/TutorSearch/admin/adduser.jsp');

t=outlookbar.addtitle('普通用户','用户管理',1);
outlookbar.additem('用户信息',t,'/TutorSearch/admin/userlist.jsp');

t=outlookbar.addtitle('管理员','用户管理',1);
outlookbar.additem('管理员信息',t,'/TutorSearch/admin/adduser.jsp');


t=outlookbar.addtitle('教员管理','教员管理',1);
outlookbar.additem('添加教员',t,'/TutorSearch/admin/adduser.jsp');
outlookbar.additem('教员库',t,'/TutorSearch/admin/add.jsp');

t=outlookbar.addtitle('家教管理','家教管理',1);
outlookbar.additem('添加家教',t,'/TutorSearch/tutor/addtutor.jsp');
outlookbar.additem('查看家教',t,'/TutorSearch/admin/add.jsp');


t=outlookbar.addtitle('日志管理','日志管理',1);
outlookbar.additem('搜索日志',t,'/TutorSearch/admin/add.jsp');
outlookbar.additem('登录日志',t,'/TutorSearch/admin/add.jsp');
outlookbar.additem('系统日志',t,'/TutorSearch/admin/add.jsp');

