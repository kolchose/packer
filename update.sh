cd git-tests

GEM=autotest
VERSION=4.1.4

echo $GEM $VERSION

git init

git remote add origin git@github.com:tiii/git-tests.git

git config core.sparseCheckout true

touch .git/info/sparse-checkout
echo ".ruby-version" >> .git/info/sparse-checkout
echo ".rbenv-version" >> .git/info/sparse-checkout
echo ".rvm-version" >> .git/info/sparse-checkout
echo "Gemfile" >> .git/info/sparse-checkout
echo "Gemfile.lock" >> .git/info/sparse-checkout

git pull origin master --depth 1

echo "gem '$GEM', '$VERSION'" >> Gemfile
bundle lock
git commit -am "Update $GEM to $VERSION"

BRANCH_NAME=packer/update-$GEM-to-$VERSION
git checkout -b $BRANCH_NAME
git push --force --set-upstream origin $BRANCH_NAME
