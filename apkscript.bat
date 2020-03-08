IF APPVEYOR_REPO_BRANCH=="develop"(
	echo "Building a Pull Request"
git config --global user.name "AutoBot"
git config --global user.email "raghavawasthi2014@gmail.com"

git clone --quiet --branch=apk https://RaghavAwasthi:$GITHUB_API_KEY@github.com/RaghavAwasthi/barview-android apk 
cd apk
cp C:\projects\barview-android\app\build\outputs\apk\app-debug.apk ./test-android.apk
git status
ls
git checkout --orphan temporary
git status

git add test-android.apk
git commit -am "[Auto] Update Test Apk (%date% %time%)"
echo "commit Done"

git branch -D apk
git branch -m apk

git push origin apk --force --quiet 
) ELSE IF APPVEYOR_REPO_BRANCH=="master" (
echo "Building a Pull Request on master"
git config --global user.name "AutoBot"
git config --global user.email "raghavawasthi2014@gmail.com"

git clone --quiet --branch=apk https://RaghavAwasthi:$GITHUB_API_KEY@github.com/RaghavAwasthi/barview-android apk 
cd apk
cp C:\projects\barview-android\app\build\outputs\apk\app-debug.apk ./master-android.apk
git status
ls
git checkout --orphan temporary
git status

git add master-android.apk
git commit -am "[Auto] Update Test Apk (%date% %time%)"
echo "commit Done"

git branch -D masterapk
git branch -m masterapk

git push origin masterapk --force --quiet 
)
ELSE(

	echo "Not a Pull Request"
	)
