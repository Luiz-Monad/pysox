
# pre
Push-Location $PSScriptRoot
$out = '../sox-build/pysox'
$build = (New-Item -ItemType Directory $out -Force).FullName

# build

python setup.py sdist -d $build

# install

$egg = ((Get-ChildItem $build)[0].FullName)
pip install "file://$egg"

# Clean
Remove-Item -Recurse -Force 'sox.egg-info'

# done
Pop-Location
