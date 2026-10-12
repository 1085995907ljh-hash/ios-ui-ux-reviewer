# 制作记录

日期：2026-10-12。模式：Yao Scaffold，个人可复用基线。后续按用户要求提供 Git 仓库供同事试用，版本为 0.1.0 预览版；没有升级为已通过完整团队门禁的 Production 版本。

target_root：本仓库根目录。
identity：ios-ui-ux-reviewer。
engine_root：制作机器上的 yao-meta-skill，仅只读使用；不作为运行依赖分发。
安装副本：Codex 用户目录下的 skills/ios-ui-ux-reviewer。首次安装不覆盖已有技能。

参考扫描：

1. 用户 iOS-UI-设计规则.md：保留官方链接与实践规则区分；不把教学例子当绝对规范。
2. Apple HIG 与审核指南：使用本次课程已核对的官方来源；未来每次审查核对相关版本敏感规则。
3. ios-app-qa：借鉴真实操作、截图和覆盖记录，不照搬其 P0 分级。
4. xcodebuildmcp：借鉴 session defaults 与模拟器工具选择，不写死项目、设备或工具参数。

打包保留独立 design-rules.md 快照，便于跨项目使用。原课程文件不修改。

评测边界：trigger_eval.py 是本地词语/概念启发式检查，不是模型真实调用或盲测。源码夹具用于检验报告逻辑，不是可编译的完整 App。暂未对真实 Xcode 工程进行端到端审查。

后续最高价值验证：在真实 SwiftUI 项目试审；在 UIKit 项目试审；把用户确认的误报加入回归用例。
