import { setWatermarkText, WatermarkComponent } from 'lib_watermark';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    console.log('------------Index aboutToAppear')
  }
  onPageShow(): void {
    console.log('------------Index onPageShow')
    setWatermarkText('林俊杰 2000022')
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
      WatermarkComponent()
    }
    .height('100%')
    .width('100%')
  }
}