import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import ts from 'typescript';
const cache = new Map();
function load(file) {
 file=path.resolve(file);if(cache.has(file))return cache.get(file);
 if(file.endsWith('.json'))return JSON.parse(fs.readFileSync(file,'utf8'));
 const mod={exports:{}};cache.set(file,mod.exports);
 const code=ts.transpileModule(fs.readFileSync(file,'utf8'),{compilerOptions:{module:ts.ModuleKind.CommonJS,target:ts.ScriptTarget.ES2022,esModuleInterop:true}}).outputText;
 vm.runInNewContext(code,{module:mod,exports:mod.exports,Date,Map,Set,require:(name)=>load(path.resolve(path.dirname(file),name+(path.extname(name)?'':'.ts')))},{filename:file});return mod.exports;
}
const {runtimeState}=load('app/current-runtime.ts');
for(const [state,tone,lsp,root,message] of [
 ['ready','blue',true,true,'模块已就绪'],['lsp-only','yellow',true,false,'请授予 ROOT 权限'],
 ['root-only','yellow',false,true,'请检查 LSP 作用域并重启手机'],['missing','red',false,false,'请检查 LSP 作用域及 ROOT 权限，并重启手机'],
 ['update-pending','yellow',true,true,'请重启手机以启用当前版本']]){
 const actual=runtimeState({'prototype:runtime-state':state});
 assert.equal(actual.tone,tone);assert.equal(actual.lsp,lsp);assert.equal(actual.root,root);assert.equal(actual.message,message);
}
const {buildLog,recordEvent}=load('app/current-log.ts');
const catalog=load('app/current-catalog.json');
const option=catalog.options.find(o=>o.kind==='BOOLEAN');assert.ok(option,'boolean feature catalog must exist');
recordEvent('setting_changed',option.key,'1');
recordEvent('setting_changed','access_token','private-token');
const text=buildLog({[option.key]:'1',access_token:'private-token','prototype:runtime-state':'missing'},'2026-09-30T00:00:00Z');
assert.ok(text.includes(option.title+' | '+option.key+'=1'));
assert.ok(text.includes('model=NX809J'));assert.ok(text.includes('system_version=RedMagicOS11.5.7MR1'));
assert.ok(text.includes('root_granted=false'));assert.ok(text.includes('phone_logcat=NOT_COLLECTED'));
assert.ok(text.includes('setting_changed'));assert.ok(!text.includes('private-token'));
fs.writeFileSync('review-log-test.txt',text);
console.log('Passed: four runtime combinations, enabled features, device metadata, event records, redaction and collection boundaries.');
const {navigationTargets}=load('app/current-navigation.ts');
assert.equal(navigationTargets.length,18);assert.ok(!navigationTargets.some(t=>t.id==='collab'));
const mergedTheme=navigationTargets.find(t=>t.id==='theme');
const originalTheme=catalog.targets.find(t=>t.id==='theme');
const collab=catalog.targets.find(t=>t.id==='collab');
const originalSystemUi=catalog.targets.find(t=>t.id==='systemui');
const movedLockScreen=originalSystemUi.sections.filter(section=>['lockscreen','aod'].includes(section.id)).flatMap(section=>section.options.map(option=>option.key));
const keys=t=>t.sections.flatMap(s=>s.options.map(o=>o.key));
assert.deepEqual([...keys(mergedTheme)].sort(),[...keys(originalTheme),...keys(collab),...movedLockScreen].sort());
assert.equal(mergedTheme.title,'主题与锁屏');
const notifications=navigationTargets.find(target=>target.id==='systemui');
assert.equal(notifications.title,'通知与控制中心');
assert(movedLockScreen.every(key=>!keys(notifications).includes(key)));
assert.equal(navigationTargets.flatMap(keys).length,250);
assert.equal(new Set(navigationTargets.flatMap(keys)).size,250);
console.log('Passed: 18 historical navigation groups; theme, collaboration, lock-screen and AOD settings preserved under Theme and Lock Screen; notification directory titles and 250 unique settings remain correct.');
