import { emitter } from "@kit.BasicServicesKit";
import { EventType } from "./EventType";

@Component
export struct WatermarkComponent {
  @Prop waterText?: string
  @Prop textSize: number = 14
  @Prop textColor: string = 'rgba(80,80,80,0.08)'
  @Prop angle: number = -20
  @Prop gapX: number = 120
  @Prop gapY: number = 180


  aboutToAppear(): void {
    console.log('------------WatermarkComponent aboutToAppear')
    emitter.on(EventType.WaterMarkEvent, (eventData: emitter.EventData) => {
      const waterText = eventData?.data?.waterText as string //全局安全水印
      this.waterText = waterText
    });
  }

  aboutToDisappear(): void {
    emitter.off(EventType.WaterMarkEvent)
  }

  build() {
    // 全屏水印层
    Stack() {
      // 在这里放重复水印
      if (this.waterText) {
        this.renderWatermark();
      }
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Center)
    .backgroundColor(Color.Transparent)
    .hitTestBehavior(HitTestMode.Transparent) // 穿透点击
    .zIndex(9999);
  }

  // 绘制多个水印
  @Builder
  private renderWatermark() {
    Column() {
      ForEach(Array.from({ length: 100 }), (_: number, index: number) => {
        Row() {
          ForEach(Array.from({ length: 30 }), () => {
            Text(this.waterText)
              .fontSize(this.textSize)
              .fontColor(this.textColor) // 透明度
              .padding({ right: this.gapX, bottom: this.gapY})
          }
          )
        }.rotate({
          angle: this.angle,
        }).margin({left:index % 2 == 0?0:(this.textSize * (this.waterText||'').length) / 2})
      })
    }.margin({top:-100})
  }
}