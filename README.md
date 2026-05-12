# lib_watermark

A HarmonyOS watermark component supporting security watermark overlay.

## Install

```bash
ohpm install @ericbyliang/lib_watermark
```

## Usage
全局安全水印组件加入顶级根界面即可，永远处于页面最上层：
```ts
import { setWatermarkText, WatermarkComponent } from '@ericbyliang/lib_watermark';
build() {
     Root() {
        ....
        WatermarkComponent()
      }
}
```
全局设置水印文本
```ts
import { setWatermarkText, WatermarkComponent } from '@ericbyliang/lib_watermark';
// 设置水印，比如登录后，设置一次即可
setWatermarkText("林俊杰 2000022");
// 取消水印，比如在登录页面
setWatermarkText("");
```
动态设置水印文本&自定义水印样式
```ts
WatermarkComponent({
    waterText:'周杰伦 1000001',
    textSize: 14,
    textColor: 'rgba(80,80,80, 0.01)',
    angle: -20,
    grapX: 120,
    grapY: 180
})
```
