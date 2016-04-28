<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<?xml-stylesheet ekr_test ?>
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="amd.20160329124757.1"><vh>跳出 users 目錄</vh></v>
<v t="amd.20160329124554.2" a="E"><vh>@path ./../</vh>
<v t="amd.20160329164739.1" a="E"><vh>假如要送到 gh-pages 分支, 使用下列按鈕</vh>
<v t="amd.20160329164739.2"><vh>@button gh-pages pelican</vh></v>
</v>
<v t="leo.20160408095026.1" a="E"><vh>wordpress</vh>
<v t="leo.20160408095046.1"><vh>@button new-to-wp</vh></v>
<v t="leo.20160408095101.1"><vh>@button edit-to-wp </vh></v>
<v t="leo.20160408095102.1"><vh>@button get-from-wp</vh></v>
</v>
<v t="amd.20160329163719.1" a="E"><vh>假如要在近端檢視, 使用下列按鈕</vh>
<v t="amd.20160329163719.2"><vh>@button local pelican</vh></v>
</v>
<v t="amd.20160329162138.1" a="E"><vh>設定檔案</vh>
<v t="leo.20160401105240.1"><vh>共用檔案</vh></v>
<v t="leo.20160401105034.1"><vh>@edit pelicanconf.py</vh></v>
<v t="leo.20160401105245.1"><vh>遠端專用</vh></v>
<v t="leo.20160401105035.1"><vh>@edit publishconf.py</vh></v>
<v t="leo.20160401105246.1"><vh>近端專用</vh></v>
<v t="leo.20160401105037.1"><vh>@edit local_publishconf.py</vh></v>
</v>
<v t="amd.20160329124921.1"><vh>@edit index.html</vh></v>
<v t="amd.20160329124849.1"><vh>進入 content 目錄</vh></v>
<v t="amd.20160329124903.1" a="E"><vh>@path content</vh>
<v t="leo.20160401114622.1"><vh>@clean admin-20160401.md</vh></v>
<v t="leo.20160428223049.1"><vh>@clean admin-20160402.md</vh></v>
<v t="leo.20160428223237.1"><vh>@clean admin-20160403.md</vh></v>
<v t="leo.20160428223244.1"><vh>@clean admin-20160404.md</vh></v>
<v t="leo.20160428223247.1"><vh>@clean admin-20160405.md</vh></v>
<v t="leo.20160428223251.1"><vh>@clean admin-20160406.md</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="amd.20160329124554.2"></t>
<t tx="amd.20160329124757.1"></t>
<t tx="amd.20160329124849.1"></t>
<t tx="amd.20160329124903.1"></t>
<t tx="amd.20160329162138.1"></t>
<t tx="amd.20160329163719.1"></t>
<t tx="amd.20160329163719.2">@language python
import os
#os.system("pelican content -o output -s local_publishconf.py -t theme/pelican-bootstrap3")
os.system("pelican content -o post -s local_publishconf.py")
g.es("admin pelican 近端執行完畢")


</t>
<t tx="amd.20160329164739.1"></t>
<t tx="amd.20160329164739.2">@language python
import os
os.system("pelican content -o post -s publishconf.py")
g.es("admin pelican 執行完畢")

</t>
<t tx="leo.20160401105240.1"></t>
<t tx="leo.20160401105245.1"></t>
<t tx="leo.20160401105246.1"></t>
<t tx="leo.20160401114622.1">@language md
Title: 40423114的網誌
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
個人網際內容管理

&lt;!-- PELICAN_END_SUMMARY --&gt;

&lt;a href="http://cmsimply-g0910841123.rhcloud.com/"&gt;CMSimply 內容管理系統&lt;/a&gt;

&lt;a href="http://g0910841123.github.io/blog/post/"&gt;Pelican 靜態網址&lt;/a&gt;

&lt;a href="http://wp-g0910841123.rhcloud.com/"&gt;WordPress 動態網誌&lt;/a&gt;
</t>
<t tx="leo.20160408095026.1"></t>
<t tx="leo.20160408095046.1">@language python
#new-to-wp button
#coding: utf-8
import xmlrpc.client
import datetime
import os
 
def get_cat_tag_content(data):
    # 請注意, 因為 data 來自 .md 的 body pan 內容, 第1行為 @language python
    # 用跳行符號分割
    data_list = data.split("\n")
    #第2行為 title
    title= data_list[1]
    #第3行為 category
    category = data_list[2]
    #第4行為 tags
    tags = data_list[3]
    # 有多項資料的 content 型別為數列
    # 再將第7行之後的資料數列串回成以跳行隔開的資料
    content = "\n".join(data_list[6:])
    # 先將截斷摘要與內文的 pelican md 檔按符號, 換成 Wordpress 的 &lt;!---more---&gt;
    content = content.replace('&lt;!-- PELICAN_END_SUMMARY --&gt;', '&lt;!--more--&gt;')
    # 接著若內容有 ~~~python 與 ~~~ 則換成 Wordpress 格式
    content = content.replace('~~~python', '[code lang="python"]')
    content = content.replace('~~~', '[/code]')
    return title, category, tags, content
 
os.environ['TZ'] = 'Asia/Taipei'
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
# 從網誌節點的 parent().h 取得 wp_url
# 從網誌節點的 parent().b 取得帳號與密碼對應的文字檔案路徑
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
wp_blogid = "0"
 
status_draft = 0
status_published = 1
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 從目前所在節點的 body pan 中取出類別, tags 以及文章內容
title_str, category_str, tags_str, content = get_cat_tag_content(p.b)
# title 是一個單獨的字串
title = title_str.split(":")[1]
# 指定時間出版
'''
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime("2013-01-01 00:00",
"%Y-%m-%d %H:%M"))
'''
# 以現在時間出版, 考慮與 Server 時間差八個小時 (480 分鐘), 因此要在 8 個小時前發表
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime((datetime.datetime.now()- \
datetime.timedelta(minutes=480)).strftime('%Y-%m-%d %H:%M'),"%Y-%m-%d %H:%M"))
categories = [category_str.split(":")[1]]
# 請注意, 因為 tags 用逗點隔開, 因此必須透過 split() 再分開成為 list 資料
# 先用 : 斷開標投頭的 Tags:, 然後再透過逗點隔開, 將標註轉為數列資料
tags = tags_str.split(":")[1].split(",")
data = {'title': title, 'description': content, 'dateCreated': date_created, 'categories': categories, 'mt_keywords': tags}
 
post_id = server.metaWeblog.newPost(wp_blogid, wp_username, wp_password, data, status_published)
# 利用最後的 child 節點來儲存 post_id
to_save_post_id = p.insertAsLastChild()   
# 改為內文為空的節點, id 直接標在 head 標題 
to_save_post_id.b = ""
to_save_post_id.h = post_id
# 因為新增節點, commander 必須 redraw
c.redraw() 
 
g.es("post_id 為", post_id)
g.es("已經送出資料!")</t>
<t tx="leo.20160408095101.1">@language python
#edit-to-wp
#coding: utf-8
import xmlrpc.client
import datetime
import os
 
def get_cat_tag_content(data):
    # 請注意, 因為 data 來自 .md 的 body pan 內容, 第1行為 @language python
    # 用跳行符號分割
    data_list = data.split("\n")
    #第2行為 title
    title= data_list[1]
    #第3行為 category
    category = data_list[2]
    #第4行為 tags
    tags = data_list[3]
    # 有多項資料的 content 型別為數列
    # 再將第7行之後的資料數列串回成以跳行隔開的資料
    content = "\n".join(data_list[6:])
    # 先將截斷摘要與內文的 pelican md 檔按符號, 換成 Wordpress 的 &lt;!---more---&gt;
    content = content.replace('&lt;!-- PELICAN_END_SUMMARY --&gt;', '&lt;!--more--&gt;')
    # 接著若內容有 ~~~python 與 ~~~ 則換成 Wordpress 格式
    content = content.replace('~~~python', '[code lang="python"]')
    content = content.replace('~~~', '[/code]')
    return title, category, tags, content
 
os.environ['TZ'] = 'Asia/Taipei'
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
wp_blogid = "0"
 
status_draft = 0
status_published = 1
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 從目前所在節點的 body pan 中取出類別, tags 以及文章內容
title_str, category_str, tags_str, content = get_cat_tag_content(p.b)
# title 是一個單獨的字串
title = title_str.split(":")[1]
# 指定時間出版
'''
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime("2013-01-01 00:00",
"%Y-%m-%d %H:%M"))
'''
# 以現在時間出版, 考慮與 Server 時間差八個小時 (480 分鐘), 因此要在 8 個小時前發表
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime((datetime.datetime.now()- \
datetime.timedelta(minutes=480)).strftime('%Y-%m-%d %H:%M'),"%Y-%m-%d %H:%M"))
categories = [category_str.split(":")[1]]
# 請注意, 因為 tags 用逗點隔開, 因此必須透過 split() 再分開成為 list 資料
tags = tags_str.split(":")[1].split(",")
data = {'title': title, 'description': content, 'dateCreated': date_created, 'categories': categories, 'mt_keywords': tags}
 
# 設法取得原 post 的 id
origin_post = p.getLastChild()
# 直接從標題取得 post 的 id 號碼
post_id = origin_post.h
status = server.metaWeblog.editPost(post_id, wp_username, wp_password, data, status_published)
 
if status:
    g.es("資料已經更新!")
else:
    g.es("有問題, 資料沒有更新!")</t>
<t tx="leo.20160408095102.1">@language python
#get-from-wp
#coding: utf-8
import xmlrpc.client
# 導入 html 模組, 使用 html.unescape 轉換 html 特殊符號
import html
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
# 從網誌節點的 parent().h 取得 wp_url
# 從網誌節點的 parent().b 取得帳號與密碼對應的文字檔案路徑
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 設法透過上述網誌網址, 帳號與密碼, 以及文章 id, 取回 categories, tags, 文章標題, 文章內容等資
 
# 從最後的 child 節點來取 post_id
origin_post = p.getLastChild()
post_id = origin_post.h
# 取回與 post_id 對應的網誌文章內容
blog_content = server.metaWeblog.getPost(post_id, wp_username, wp_password)
title = blog_content["title"]
# 這裡要利用 html.unescape 轉回特殊符號
description = html.unescape(blog_content["description"])
mt_text_more = html.unescape(blog_content["mt_text_more"])
if mt_text_more != "":
    post_content = description + "\n&lt;!--more--&gt;\n"+mt_text_more
else:
    post_content = description
# 所取回的 categories 為 list
categories = blog_content["categories"]
# 所取回的 tags 為以逗點隔開的字串
mt_keywords = blog_content["mt_keywords"]
# 取回文章作者
author = blog_content["wp_author_display_name"]
p.h = title
categories_str = ""
for category in categories:
    # 假如不是最後一個
    if category != categories[len(categories)-1]:
        categories_str += category + ", "
    else:
        # 這是最後一個
        categories_str += category
line1 = "@language md\n"
line2 = "Title: " +title + "\n"
line3 = "Category: " + categories_str + "\n"
line4 = "Tags: " + mt_keywords + "\n"
line5 = "Author: " + author + "\n@others\n"
post_content = post_content.replace('&lt;!--more--&gt;', '\n&lt;!-- PELICAN_END_SUMMARY --&gt;\n')
post_content = post_content.replace('[code lang="python"]', '~~~python')
post_content = post_content.replace('[/code]', '~~~')
p.b = line1 + line2 + line3 + line4 + line5 + post_content + "\n"
# 因為節點資料更新, commander 必須 redraw
c.redraw() 
g.es("資料已經取回")</t>
<t tx="leo.20160428223049.1">@language md
Title: 跳線及網路線
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
跳線測試

&lt;!-- PELICAN_END_SUMMARY --&gt;

&lt;iframe width="560" height="315" src="https://www.youtube.com/embed/fLf7yW2Ei2A" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;


網絡線 由於沒有線了所以我沒有做到
</t>
<t tx="leo.20160428223237.1">@language md
Title: 網路配置
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
我不會 做

&lt;!-- PELICAN_END_SUMMARY --&gt;

&lt;iframe src="http://i.imgur.com/gkXsFqf.jpg" width="960" height="1280" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen&gt;&lt;/iframe&gt;
</t>
<t tx="leo.20160428223244.1">@language md
Title: 虛擬規劃
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
個人網際內容管理

&lt;!-- PELICAN_END_SUMMARY --&gt;

&lt;a href="https://cms-mde40423117.rhcloud.com/"&gt;CMSimply 內容管理系統&lt;/a&gt;

&lt;a href="http://40423117.github.io/blog/post/index.html"&gt;Pelican 靜態網址&lt;/a&gt;

&lt;a href="http://wp-mde40423117.rhcloud.com"&gt;WordPress 動態網誌&lt;/a&gt;
</t>
<t tx="leo.20160428223247.1">@language md
Title: 3個按鈕
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
3個按鈕測試

&lt;!-- PELICAN_END_SUMMARY --&gt;

</t>
<t tx="leo.20160428223251.1">@language md
Title: 測試
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423114
@others
測試
&lt;!-- PELICAN_END_SUMMARY --&gt;


</t>
</tnodes>
</leo_file>
