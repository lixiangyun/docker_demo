## Git常用命令
### 查看当前修改状态
git status

### 添加本地所有修改文件
git add .

### 添加本地所有修改java文件
git add *JAVA

### 添加指定修改的文件
git add [filepath]

### 查看修改差异
git diff

###  提交
git commit -m ""

### 修改上次提交commit
git commit –-amend

### 查看提交记录
git log

### 查看commit后修改差异
git show

### 撤销修改到最初状态
git reset HEAD^

### 设置代理
git config --global https.proxy http://127.0.0.1:8080

git config --global https.proxy https://127.0.0.1:8080