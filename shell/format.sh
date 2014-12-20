#  在temp下新建txt文件
#   该脚本会把txt文件用模板包裹起来放到对应的view文件夹下
echo 'Start!'
echo '输入文章类型: 例如 blog'
read type
echo '输入文章名称:  **.txt'
read name
echo '输入文章标题: 例如 测试'
read title

# type='blog'
# name='2014-8-11'
# title='测试'

cd ..
cd temp

cat atemplate1.html >> '../view/'$type'/'$name'.html'
cat $name'.txt' >> '../view/'$type'/'$name'.html'
cat atemplate2.html >> '../view/'$type'/'$name'.html'



cd '../view/'$type'/'

`sed -i '/daitihuan/r ../../temp/litemplate.html' list.html`

if [[ 'blog'==$type ]]; then
    sed -i 's/tititi/博客/g' $name'.html'
    sed -i 's/typetype/blog/g' $name'.html'
fi

if [[ 'idea'==$type ]]; then
    sed -i 's/tititi/想法/g' $name'.html'
    sed -i 's/typetype/idea/g' $name'.html'
fi

if [[ 'zheteng'==$type ]]; then
    sed -i 's/tititi/折腾/g' $name'.html'
    sed -i 's/typetype/zheteng/g' $name'.html'
fi

sed -i s/datedate/$name/g list.html
sed -i s/tititile/$title/g list.html

echo 'End!'
