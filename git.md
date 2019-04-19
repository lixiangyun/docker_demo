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


### 强制刷新user&email

#### 更新本地配置
```
git config user.name 'lixiangyun'
git config user.email 'linimbus@126.com'
```

#### 执行脚本 update.sh
```
#!/bin/sh

git filter-branch -f --env-filter '

OLD_NAME="lixiangyun"
OLD_EMAIL="lixiangyun@126.com"
CORRECT_NAME="linimbus"
CORRECT_EMAIL="linimbus@126.com"

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

```

#### 异常清理
```
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch Rakefile' HEAD
```

#### 查看&提交
```
git log
git push origin --force --all
```
