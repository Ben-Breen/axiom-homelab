# New-AxiomSkeleton.ps1
# Creates the initial Axiom Homelab repository structure.
# Existing files are left untouched.

$Root = (Get-Location).Path

if (-not (Test-Path (Join-Path $Root "README.md"))) {
    Write-Warning "README.md was not found."
    Write-Warning "Run this script from the root of the axiom-homelab repository."
    exit 1
}

$PlaceholderFiles = @(
    "docs/architecture.md"
    "docs/hardware.md"
    "docs/networking.md"
    "docs/services.md"
    "docs/storage.md"
    "docs/backup-and-recovery.md"
    "docs/remote-access.md"
    "docs/troubleshooting/README.md"
    "docs/standards/documentation.md"
    "diagrams/README.md"
    "configs/README.md"
    "scripts/README.md"
)

foreach ($RelativePath in $PlaceholderFiles) {

    $FullPath = Join-Path $Root $RelativePath
    $Directory = Split-Path $FullPath -Parent

    # Create the parent directory if necessary.
    if (-not (Test-Path $Directory)) {
        New-Item -ItemType Directory -Path $Directory -Force | Out-Null
        Write-Host "Created directory: $Directory"
    }

    # Create the placeholder without overwriting existing work.
    if (-not (Test-Path $FullPath)) {
        "<!-- TODO: Documentation pending -->" |
            Set-Content -Path $FullPath -Encoding utf8

        Write-Host "Created file: $RelativePath"
    }
    else {
        Write-Host "Skipped existing file: $RelativePath"
    }
}

Write-Host ""
Write-Host "Axiom repository skeleton created successfully."