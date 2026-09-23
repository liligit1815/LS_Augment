import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';
import {createRequire} from 'node:module';
import ts from 'typescript';
import {backupSettings, restoreSettings} from '../app/current-backup.ts';
import {clockPatternValid, validText} from '../app/current-validation.ts';
import {POST} from '../app/api/config-export/route.ts';

const require=createRequire(import.meta.url);
const read=(name)=>JSON.parse(fs.readFileSync(new URL('../app/'+name,import.meta.url),'utf8'));
const data=read('current-editor-data.json');
const defaults=Object.fromEntries(Object.values(data.defaults).map(d=>[d.key,typeof d.default==='boolean'?(d.default?'1':'0'):String(d.default)]));
const key=name=>data.defaults[name].key;
const before={...defaults,'prototype:health-bound':'1','prototype:rapid-compatible':'1','hide:0:apps':'com.example.test','hide:0:state:com.example.test':'1','audio:0:0':'250','status:clock:size':'28'};
const emptyBackup=backupSettings(defaults);
const restored=restoreSettings(before,emptyBackup,defaults);
assert.equal(restored['audio:0:0'],undefined);
assert.equal(restored['status:clock:size'],undefined);
assert.equal(restored['hide:0:apps'],undefined);
assert.equal(restored['hide:0:state:com.example.test'],'0');
assert.equal(restored['prototype:health-bound'],'1');
assert(!Object.keys(backupSettings(before)).some(k=>k.startsWith('prototype:')||k.includes(':state:')));
const unbound=restoreSettings({}, {...before,[key('HEALTH_PLAN_ENABLED')]:'1',[key('TGK_RAPID_FIRE_ENABLED')]:'1'},defaults);
assert.equal(unbound[key('HEALTH_PLAN_ENABLED')],'0');
assert.equal(unbound[key('TGK_RAPID_FIRE_ENABLED')],'0');
assert.equal(unbound['prototype:health-bound'],undefined);
assert(clockPatternValid("HH:mm '本地'"));
assert(!clockPatternValid("HH:mm '未闭合"));
assert(!clockPatternValid('PPP'));
assert(!validText('wifi_country','CHN',64));
assert(validText('wifi_country','CN',64));
assert(!validText('wifi_mac','00:11:22:33:44:ZZ',128));

// Evaluate only exported health plan logic; React rendering is exercised in the browser.
const source=fs.readFileSync(new URL('../app/current-health.tsx',import.meta.url),'utf8');
const compiled=ts.transpileModule(source,{compilerOptions:{module:ts.ModuleKind.CommonJS,jsx:ts.JsxEmit.ReactJSX,esModuleInterop:true}}).outputText;
const module={exports:{}};
vm.runInNewContext(compiled,{module,exports:module.exports,require:path=>path==='./current-ui'?{}:path==='./current-editor-data.json'?data:path==='./current-editor-help.json'?read('current-editor-help.json'):require(path),Date,Set});
const {validateHealthPlan,healthDraftUpdates}=module.exports;
const plan={start:'09:00',end:'18:00',count:'10',steps:'200',days:['1','2','3','4','5']};
assert.equal(validateHealthPlan(plan),'');
assert.equal(validateHealthPlan({...plan,start:'23:30',end:'00:30'}),'');
for(const patch of [{end:'09:00'},{days:[]},{count:'0'},{count:'101'},{steps:'100001'},{start:'25:00'},{start:'09:00',end:'09:03'}]) assert(validateHealthPlan({...plan,...patch}));
const draft={...plan,account:'sample',multiplyEnabled:true,planEnabled:true,limitEnabled:true,multiplier:3,limit:'10000'};
const updates=healthDraftUpdates(draft);
assert.equal(updates[key('HEALTH_MULTIPLIER')],'300');
assert.equal(updates['health:steps'],'200');
const invalid=healthDraftUpdates({...draft,steps:'100001'});
assert.equal(invalid['health:steps'],undefined);
assert.equal(invalid[key('HEALTH_DAILY_LIMIT_STEPS')],'10000');
assert.equal(healthDraftUpdates({...draft,account:''})[key('HEALTH_PLAN_ENABLED')],undefined);
assert.equal(healthDraftUpdates({...draft,limit:'',limitEnabled:false})[key('HEALTH_DAILY_LIMIT_ENABLED')],'0');

const catalog=read('current-catalog.json');
assert.equal(catalog.targets.length,18);
assert.equal(new Set(read('current-scope.json')).size,26);
assert.equal(catalog.targets.flatMap(t=>t.sections.flatMap(s=>s.options)).length,199);
for(const body of [{format:'LS_Augment.UIPrototype',version:2,settings:emptyBackup},{format:'LS_Augment.UIPrototype',version:1,status:{enabled:true},settings:{legacy:true}}]){
 const response=await POST(new Request('http://localhost/api/config-export',{method:'POST',body:new URLSearchParams({configuration:JSON.stringify(body)})}));
 assert.equal(response.status,200);
 assert(response.headers.get('Content-Disposition').includes('attachment'));
 assert.deepEqual(JSON.parse(await response.text()),body);
}
const rejected=await POST(new Request('http://localhost/api/config-export',{method:'POST',body:new URLSearchParams({configuration:'{"format":"wrong"}'})}));
assert.equal(rejected.status,400);
console.log('PASS: backup replacement and runtime exclusions; health plan boundaries; text validation; 18 targets/199 settings/26 scopes; v1/v2 downloads.');
