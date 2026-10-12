# iOS UI/UX 审查师

给 Codex 使用的技能。读取 Xcode 工程，找出界面、交互和用户体验问题，并给出具体修改建议。

支持 SwiftUI 和 UIKit。以 Apple 官方设计指南为主要参考。默认用中文写报告，保留 App 的英文界面文案。默认不修改 App 代码。

**当前状态：预览版。** 已检查技能结构、触发匹配和合成源码示例。尚未在真实 Xcode 工程上完成端到端验证。不能保证发现所有问题或通过 App Store 审核。

## 1. 安装

### 推荐：让 Codex 安装

把下面整段发给你电脑上的 Codex：

```text
请使用 skill-installer，将 GitHub 仓库 https://github.com/1085995907ljh-hash/ios-ui-ux-reviewer 安装为全局 Codex 技能。技能位于仓库根目录，名称为 ios-ui-ux-reviewer。安装器参数使用 --repo 1085995907ljh-hash/ios-ui-ux-reviewer --path . --name ios-ui-ux-reviewer。如果已经安装，先检查本地修改并备份，再更新。完成后检查 SKILL.md 和 references 目录，并告诉我如何使用。不要开始审查或修改我的 App。
```

不需要先安装 Yao。Yao 用于制作这个技能，不是运行依赖。

### 可选：在 macOS 终端安装

需要 Git。执行：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/1085995907ljh-hash/ios-ui-ux-reviewer.git \
  "${CODEX_HOME:-$HOME/.codex}/skills/ios-ui-ux-reviewer"
```

已有同名目录时，命令会停止。不要直接删除已有技能。

安装后，在 Codex 的下一轮对话中调用。如果还未识别，重新打开会话。

若仓库是私有仓库，先让维护者授予你的 GitHub 账号访问权限，并在本机完成 GitHub 身份验证。不要把令牌发到聊天里。

## 2. 开始审查

在 Codex 中打开你的 Xcode 项目文件夹，然后发送：

```text
使用 $ios-ui-ux-reviewer 审查当前 iOS App 的 UI、UX 和交互。
先读取工程和相关状态代码。模拟器可用时，验证安全的主要流程。
按严重程度列出问题，提供代码位置、证据、用户影响、修改建议和验收步骤。
区分已确认问题与待验证风险。保存中文 Markdown 报告。
先不修改 App 代码。
```

只审查代码：

```text
使用 $ios-ui-ux-reviewer 检查登录、付费页和设置。
只做源码审查，不构建、不启动 App。
不能确定的视觉或交互问题列为待验证。不要改代码。
```

也可以提供工程绝对路径。不需要先打开 Xcode 窗口。大项目默认优先检查主流程、共享控件和高风险入口；报告必须说明未覆盖的页面。

## 3. 环境要求

| 用法 | 所需条件 |
|---|---|
| 源码审查 | 可读取项目文件的 Codex；本技能 |
| 截图审查 | 用户提供截图；无法仅凭截图确定源码位置 |
| 模拟器验证 | macOS、可用的 Xcode 与模拟器、可构建工程、已配置的 XcodeBuildMCP 与 UI 自动化能力 |

本仓库不会自动安装 Xcode、XcodeBuildMCP 或其他技能。

模拟器审查会参考已安装的 `xcodebuildmcp` 和 `ios-app-qa`。辅助技能未安装、工具不可用或工程无法运行时，继续源码审查，并列出人工验证步骤。源码模式不依赖它们。

## 4. 检查范围

- 页面层级、导航、返回、关闭与取消。
- 字体、布局、安全区域、大字、深色模式和键盘遮挡。
- 按钮、点击区域、表单、焦点和错误提示。
- 加载、空状态、失败恢复、重复提交和数据保留。
- 无障碍语义、权限、引导、登录、账户与订阅流程。
- 美国市场的英文文案、日期、单位和价格展示。

规则分为 Apple 审核要求、Apple 设计建议、项目约定和实践建议。不会把个人审美或教学参考数值当成统一的拒审标准。版本敏感规则需要核对当前 Apple 官方说明。

## 5. 报告内容

默认报告路径：

```text
你的项目/docs/ui-ux-reviews/<日期>-<范围>/review.md
```

已有报告不会被覆盖。每条问题包括：严重程度 P0–P3、证据状态、用户影响、实际与预期行为、文件行号或截图位置、修改建议、验收步骤。

证据状态分为源码确认和运行已复现。待验证风险与可选改进单独列出。允许零条确认问题，不强行凑数量。

例子：保存失败后，代码没有重置加载状态。按钮一直禁用。报告会指出对应分支，建议统一恢复状态，并要求验证“失败后可以重试”。见[示例报告](reports/sample-review.md)。

## 6. 使用边界

- 默认只写审查报告。修改 App 需要另行提出请求。
- 静态代码不能证明真实点击范围、最终对比度或 VoiceOver 体验。
- 不自动购买、外发消息、删除账户、部署、上传工程或清空模拟器。
- 不把私有源码提交给公共网页服务。模型服务如何处理项目内容，取决于你使用的 Codex 账户和相关设置。
- 本项目不是 Apple 官方工具。教学快照不替代当前官方文档。

## 7. 更新与卸载

让 Codex 更新：提供本仓库地址，要求先备份已有技能和本地改动，再安装新版。

如果通过 Git clone 安装，先检查本地修改：

```bash
git -C "${CODEX_HOME:-$HOME/.codex}/skills/ios-ui-ux-reviewer" status --short
```

没有输出时，再更新：

```bash
git -C "${CODEX_HOME:-$HOME/.codex}/skills/ios-ui-ux-reviewer" pull --ff-only
```

有输出时，先保留本地改动。安装器下载的目录可能没有 Git 信息，此时使用安装器更新。

卸载时，把 `ios-ui-ux-reviewer` 文件夹移出 Codex 的 skills 目录。项目里已经生成的报告不会被删除。

## 8. 文件与验证

- [SKILL.md](SKILL.md)：技能入口。
- [审查流程](references/workflow.md)：如何读代码和验证交互。
- [审查矩阵](references/audit-matrix.md)：检查主题与误报保护。
- [报告格式](references/report-contract.md)：输出约定。
- [设计规则](references/design-rules.md)：中文课程快照与 Apple 官方链接。
- [验证记录](reports/validation.md)：已完成和仍缺少的证据。
- [行为验收用例](evals/acceptance.md)：后续真实项目回归场景。

维护者：GitHub @1085995907ljh-hash。建议在 Apple 主要系统版本更新后复核规则。反馈问题时，请说明环境和复现步骤，并先移除源码、截图中的敏感信息。
