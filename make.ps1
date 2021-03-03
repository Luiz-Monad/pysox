
# pre
Push-Location $PSScriptRoot
$out = '../sox-build/pysox'
$channel = (New-Item -ItemType Directory "$out" -Force).FullName

conda index $channel

# build

$meta = (Get-Item .).FullName
conda build $meta --no-test --croot $channel

# install

conda install --override-channels --yes -c "file:///$channel" pysox

# clean

conda build purge

# done
Pop-Location
