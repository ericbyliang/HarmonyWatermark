import  { WatermarkComponent } from './src/main/ets/components/WatermarkComponent';
import { emitter } from '@kit.BasicServicesKit';
import { EventType } from './src/main/ets/components/EventType';

const setWatermarkText = (text:string)=>{
  emitter.emit(EventType.WaterMarkEvent, {data:{waterText: text}})
}
export {
  WatermarkComponent,
  setWatermarkText
}
