import assert from 'node:assert/strict';
import {customDefaults,serializeSettings,parseSettings,planTimes} from '../app/prototype-settings.ts';
const status={enabled:true,items:{clock:{on:true,size:10,order:0,zone:'LS'}},mode:4,nr:true,sr:true,layout:[0,0,0,0,0,0],custom:true,formats:['HH:mm','MM/dd'],clockFlags:[true,false,false]};
const settings=structuredClone(customDefaults);
const before=JSON.stringify({status,settings});
const snapshot=serializeSettings(status,settings);
const restored=parseSettings(JSON.stringify(snapshot),status,settings);
assert.deepEqual(restored.settings,settings);
assert.deepEqual(restored.status,status);
assert.equal(JSON.stringify({status,settings}),before,'validation must not modify caller state');
for(const mutate of [
 s=>s.version=99,
 s=>s.settings['store:count']=0,
 s=>s.settings['clock:rows']=3,
 s=>s.settings['audio:0:0']=301,
 s=>s.settings['health:days']=[1,1],
 s=>s.settings['health:days']=[0,8],
 s=>s.settings['health:count']=0,
 s=>s.settings['health:start']='25:00',
 s=>s.settings['ai:scan']=-1,
 s=>s.settings.unknown=true,
 s=>s.status.items.clock.zone='invalid',
 s=>s.status.items.clock.size=1000,
 s=>s.status.mode=1.5,
]){const bad=structuredClone(snapshot);mutate(bad);assert.throws(()=>parseSettings(JSON.stringify(bad),status,settings))}
assert.throws(()=>parseSettings('{',status,settings));
assert.throws(()=>parseSettings('x'.repeat(2_000_001),status,settings));
const allWeek=structuredClone(snapshot);allWeek.settings['health:days']=[1,2,3,4,5,6,7];assert.equal(parseSettings(JSON.stringify(allWeek),status,settings).settings['health:days'].length,7);
const toSeconds=t=>{const day=t.startsWith('次日 ')?86400:0;const [h,m,s]=t.replace('次日 ','').split(':').map(Number);return day+h*3600+m*60+s};
for(const [start,end,min,max] of [['09:00','18:00',9*3600,18*3600],['23:30','00:30',23.5*3600,24.5*3600]]){
 const times=planTimes(start,end,12,81).map(toSeconds);assert.equal(times.length,12);assert(times.every(t=>t>=min&&t<max));assert.deepEqual([...times].sort((a,b)=>a-b),times);
 assert.deepEqual(planTimes(start,end,12,81),planTimes(start,end,12,81));assert.notDeepEqual(planTimes(start,end,12,81),planTimes(start,end,12,82));
}
console.log('配置往返、无效文件拒绝、星期选择、随机时间与跨午夜计划：通过');

const legacy=structuredClone(snapshot);delete legacy.settings['store:count'];delete legacy.settings['clock:rows'];assert.equal(parseSettings(JSON.stringify(legacy),status,settings).settings['store:count'],5);assert.equal(parseSettings(JSON.stringify(legacy),status,settings).settings['clock:rows'],2);

const {load}=await import('./load-current-module.mjs');
const {buildLog}=load('app/current-log.ts');
const definitions=load('app/current-editor-data.json').defaults;
for(const shoulder of [false,true])for(const ai of [false,true]){
 const keys=[definitions.SHOULDER_DIAGNOSTICS.key,definitions.AI_TRIGGER_DIAGNOSTICS.key];
 const text=buildLog({[keys[0]]:shoulder?'1':'0',[keys[1]]:ai?'1':'0'},'2026-09-06T00:00:00Z');
 const enabled=text.split('[配置开启的功能 · 不等同于真机生效]')[1].split('[配置快照')[0];
 assert.equal(enabled.includes(keys[0]+'=1'),shoulder);
 assert.equal(enabled.includes(keys[1]+'=1'),ai);
 assert(text.includes('phone_logcat=NOT_COLLECTED'));
 assert(text.includes('hook_install_and_hits=NOT_COLLECTED'));
}
console.log('日志导出随详细诊断开关组合变化，并明确未采集真实手机：通过');

const pictureSnapshot=structuredClone(snapshot);pictureSnapshot.settings['tile:picture']='data:image/png;base64,'+'A'.repeat(20000);assert.equal(parseSettings(JSON.stringify(pictureSnapshot),status,settings).settings['tile:picture'],pictureSnapshot.settings['tile:picture']);
for(const picture of ['https://example.com/image.png','data:image/svg+xml;base64,AAAA','data:image/png;base64,'+'A'.repeat(100001)]){const invalid=structuredClone(snapshot);invalid.settings['tile:picture']=picture;assert.throws(()=>parseSettings(JSON.stringify(invalid),status,settings))}
console.log('图片配置往返、类型及大小校验：通过');
