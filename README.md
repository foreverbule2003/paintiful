>[paintiful](https://paintiful.herokuapp.com/)

##Test account
>
user: aaa@bbb.com
password: 123
  
#@index
Feature  
1. RWD (Responsive Web Design, 在不同解析度下改變網頁頁面的佈局排版，讓不同的設備都可以正常瀏覽同一網站，提供最佳的視覺體驗.)  
2. mansonry.js (Masonry 是一個 JavaScript 網格的 library. 他對排列頁面元素的位置有著優秀的能力, 如同砌磚頭那樣排列指定的頁面元素.)  
3. bootstrap (使用度最高的前端框架之一, 對 RWD 有很好的支援.)  
 
![index.jpg](http://user-image.logdown.io/user/13777/blog/12993/post/895082/WBVi3IbTSoui7JyJNQ3t_index.jpg)

#@show
Feature  
1. Random post (展示隨機貼文)  
2. like (對喜歡貼文按讚)  
3. collect (收藏貼文, 可以在 My Profile中的 My collection看到)   
4. tool (貼文作者可以設定是用了哪些工具作畫, Nested form 的概念, 使用 cocoon 實做該功能)  

![show.jpg](http://user-image.logdown.io/user/13777/blog/12993/post/895082/bUhsuZlZSquYZuCgDCli_show.jpg)
#User/ My Profile
Feature  
1. FB or mail sing up(use mailgun to send confirm mail)  

![signin.png](http://user-image.logdown.io/user/13777/blog/12993/post/895082/AxoRX4ZSe2lAbl3y7owg_signin.png)  
2. ajax (使用 ajax 來載入貼文)  
3. willpagnate(對貼文作分頁, 降低server負擔, 也同時避免頁面過於雜亂, 暫定1 post/page)  

![my_profile.jpg](http://user-image.logdown.io/user/13777/blog/12993/post/895082/tQK1g6IXSmyr9caqy51r_my_profile.jpg)

#Test 
Unit Test(使用rspec)  
Featrue Test(使用capybara)  

#etc
i18n(internationalization, 根據不同的使用者直接採用不同的語言、數字格式、日期格式等設定, 目前僅支援部分的中<->英 .下面的例子是將 flash message 根據語系輸出.)    
![i18n.jpg](http://user-image.logdown.io/user/13777/blog/12993/post/895082/IbancWyVTCmlAitjpccg_i18n.jpg)