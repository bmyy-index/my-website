# 太白诗帘 · Text Curtain of Li Bai

> 李白最长诗《经乱离后天恩流夜郎忆旧游书怀赠江夏韦太守良宰》——以毛笔字为珠，悬于宫殿飞檐之下；鼠标拂帘，可闻珠鸣。

灵感来自 Marina Budarina 的 *Text Curtain* 文字门帘交互实验（[B 站原视频](https://www.bilibili.com/video/BV1EANm65Ekp)）。本仓库将视频画面保留，把珠帘上的文字替换为李白这首最长诗全文（约 870 字）。

## 预览

打开 `index.html` 即可在浏览器中查看效果。
鼠标划过珠帘，文字会像真实珠帘一样被拨动、碰撞、摆动并自然回弹。

## 项目结构

```
li-bai-curtain/
├─ index.html        # 单页网页（HTML + CSS + JS）
└─ assets/
   └─ roof.png       # 宫殿屋顶素材（AI 生成）
```

## 本地运行

```bash
# 任一方式启动一个本地静态服务器即可
python -m http.server 8080
# 或
npx serve .
```

然后浏览器访问 http://localhost:8080

## 部署到 GitHub Pages（远程网址访问）

### 方式一：一键脚本（推荐）

1. 在 GitHub 网页上 **New repository**，仓库名填 `li-bai-curtain`（或自取），**保持空仓库，不要初始化 README/.gitignore/license**。
2. 在本目录下运行（Git Bash / WSL / macOS / Linux 通用）：

```bash
bash deploy.sh <你的 GitHub 用户名>
```

脚本会自动配置 remote 并推送。

### 方式二：手动命令

1. 在 GitHub 网页上 **New repository**（保持空仓库）。
2. 在本目录执行：

```bash
cd li-bai-curtain
git init            # 如果还没初始化
git add .
git commit -m "feat: 李白最长诗文字珠帘"
git branch -M main
git remote add origin https://github.com/<你的用户名>/li-bai-curtain.git
git push -u origin main
```

### 启用 GitHub Pages

推送成功后：

1. 打开仓库页 → **Settings → Pages**
2. **Source** 选 `Deploy from a branch`
3. **Branch** 选 `main` / `(root)` → **Save**

等待约 30 秒，GitHub 会分配一个公开网址：

```
https://<你的用户名>.github.io/li-bai-curtain/
```

此后即可远程输入该网址访问。

## 技术要点

- 纯 HTML + CSS + JS 单文件，无任何前端框架
- 珠帘物理：每串看作以顶部锚点为轴的弹簧摆，加入阻尼、微风、鼠标作用力
- 字体：Google Fonts 的 `Ma Shan Zheng`（毛笔楷书）/ `Zhi Mang Xing`（行书）/ `Liu Jian Mao Cao`（草书），回退到系统楷体
- 素材：屋顶图由 AI 生成（已去除水印）
- 响应式：窄屏下自动减少珠帘数量、缩放字号

## 诗

李白《经乱离后天恩流夜郎忆旧游书怀赠江夏韦太守良宰》全诗 166 句、约 870 字，写经安史之乱、流放夜郎、承恩赦还，赠江夏韦太守兼怀旧游。