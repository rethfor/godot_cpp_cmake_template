# ✅ Check prerequisites
function Test-Prerequisites {
	param ([string[]]$Commands)

	$failed = $false
	foreach ($Command in $Commands) {
		try {
			Get-Command $Command -ErrorAction Stop | Out-Null
		} catch {
			$failed = $true
			Write-Host "❌ $Command is required."
			switch ($Command.ToLower()) {
				"git"   { Write-Host " 📥 Download Git: https://git-scm.com/downloads/win" }
				"cmake" { Write-Host " 📥 Download CMake: https://cmake.org/download/" }
				default { Write-Host " ℹ️ Please install '$Command' and try again." }
			}
		}
	}
	if ($failed) {
		Write-Host "🔴 Press any key to exit..."
		$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
		Exit 1
	}
}
Test-Prerequisites @("git", "cmake")

# 🏷️ Get project name
$default_project_name = Get-Location | Split-Path -Leaf
$project_name = Read-Host "📝 Enter your project name [$default_project_name]"
$project_name = $project_name.Trim()
if ($project_name -eq "") {
	$project_name = $default_project_name
}
Write-Host "📁 Using project name: '$project_name'"
$project_name_identifier = ($project_name -replace " ", "_").ToLower()

# 📦 Fetch Git submodules
Write-Host "🔄 Fetching Git submodules..."
git submodule update --init --recursive
if ($LASTEXITCODE -ne 0) {
	Write-Host "❌ Failed to fetch Git submodules."
	Write-Host "🔴 Press any key to exit..."
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	Exit 1
}
Write-Host "✅ Git submodules updated."

# 🔧 Apply project name
$dummy_name = "godot_cpp_cmake_template"
function Update-ProjectName {
	param ([string]$Path, [string]$NewName = $project_name_identifier)
	(Get-Content $Path)                                      |
		ForEach-Object { $_ -replace $dummy_name, $NewName } |
		Set-Content $Path -Encoding Ascii
}
Write-Host "🔧 Applying project name..."
Update-ProjectName(".\CMakeLists.txt")
Update-ProjectName ".\game\project.godot" $project_name
Write-Host "✅ Project name applied."

# 🛠️ Build with CMake
Write-Host "🏗️ Building the project..."
New-Item -ItemType Directory -Force -Path build -ErrorAction Stop | Out-Null
Set-Location -Path build
cmake ..
if ($LASTEXITCODE -ne 0) {
	Write-Host "❌ Failed to configure CMake."
	Write-Host "🔴 Press any key to exit..."
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	Exit 1
}
cmake --build .
if ($LASTEXITCODE -ne 0) {
	Write-Host "❌ Failed to build the project."
	Write-Host "🔴 Press any key to exit..."
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	Exit 1
}

# 🎉 Setup complete
Write-Host "✅ Setup complete! 🎉"
Write-Host "🔚 Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
Set-Location -Path ..
Remove-Item -Path "README.md" -Force
Remove-Item -Path "LICENSE" -Force
Remove-Item "$PSCommandPath"