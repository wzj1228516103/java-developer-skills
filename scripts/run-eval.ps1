param(
    [ValidateSet("codex", "qwen_code")]
    [string]$Engine = "codex",
    [string]$Model = "qwen3-coder-plus",
    [string]$BaseUrl = "https://dashscope.aliyuncs.com/compatible-mode/v1",
    [string]$CaseName = "",
    [string]$OutputDir = "./skill-up-results",
    [string]$SkillUpPath = "skill-up"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command $SkillUpPath -ErrorAction SilentlyContinue)) {
    if (-not (Test-Path -LiteralPath $SkillUpPath)) {
        throw "找不到 skill-up：请将其加入 PATH，或使用 -SkillUpPath 指定 skill-up.exe。"
    }
}

if ($Engine -eq "qwen_code") {
    if ([string]::IsNullOrWhiteSpace($env:OPENAI_API_KEY)) {
        throw "qwen_code 需要环境变量 OPENAI_API_KEY；不要把 API Key 写入脚本或仓库。"
    }
    $env:OPENAI_BASE_URL = $BaseUrl
}

$arguments = @(
    "run",
    "evals/eval.yaml",
    "--engine", $Engine,
    "--output-dir", $OutputDir,
    "--parallelism", "1"
)

if ($Engine -eq "qwen_code") {
    $arguments += @("--provider", "openai", "--model", $Model)
}

if (-not [string]::IsNullOrWhiteSpace($CaseName)) {
    $arguments += @("--include-case-name", $CaseName)
}

& $SkillUpPath @arguments
exit $LASTEXITCODE
