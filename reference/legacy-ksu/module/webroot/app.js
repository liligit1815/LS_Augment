const MODULE_ID = 'ls_augment';
const MODULE_DIR = `/data/adb/modules/${MODULE_ID}`;
const COMPANION_PKG = 'io.github.lsf.augment';
const CRITICAL_PACKAGES = new Set([
  'android', 'com.android.systemui', 'com.android.settings',
  'me.weishu.kernelsu', 'me.weishu.kernelsu.debug', 'com.rifsxd.ksunext',
  'org.lsposed.manager', COMPANION_PKG,
]);
const $ = (id) => document.getElementById(id);

const state = {
  users: [],
  activeUser: null,
  packagesByUser: new Map(),
  infoByPackage: new Map(),
  infoByTarget: new Map(),
  installTimeByPackage: new Map(),
  installTimeLoading: false,
  sortMode: 'name-asc',
  pinSelected: true,
  selected: new Set(),
  savedSelected: new Set(),
  targetState: new Map(),
  actualState: 'empty',
  total: 0,
  visible: 0,
  hidden: 0,
  unknown: 0,
  showSystem: false,
  automationEnabled: false,
  automationScope: 'current',
  automationRunning: false,
  automationActive: false,
};

let callbackCounter = 0;
let snackbarTimer = null;
function exec(command, options = {}) {
  return new Promise((resolve, reject) => {
    const bridge = globalThis.ksu;
    if (!bridge?.exec) return reject(new Error('KernelSU WebUI bridge unavailable'));
    const cb = `ls_augment_exec_${Date.now()}_${callbackCounter++}`;
    globalThis[cb] = (errno, stdout, stderr) => {
      delete globalThis[cb];
      resolve({ errno, stdout: stdout ?? '', stderr: stderr ?? '' });
    };
    try { bridge.exec(command, JSON.stringify(options), cb); }
    catch (e) { delete globalThis[cb]; reject(e); }
  });
}

function toast(text) { try { globalThis.ksu?.toast?.(String(text)); } catch (_) {} }
function getPackagesInfo(packages) {
  try { return JSON.parse(globalThis.ksu?.getPackagesInfo?.(JSON.stringify(packages)) || '[]'); }
  catch (_) { return []; }
}

function encodeLabelBase64(value) {
  try {
    const bytes = new TextEncoder().encode(String(value));
    let binary = '';
    for (const b of bytes) binary += String.fromCharCode(b);
    return btoa(binary);
  } catch (_) { return ''; }
}
function decodeLabelBase64(value) {
  try {
    const binary = atob(String(value));
    const bytes = Uint8Array.from(binary, (c) => c.charCodeAt(0));
    return new TextDecoder().decode(bytes);
  } catch (_) { return ''; }
}
function cachedInfoFor(uid, pkg) {
  const exact = state.infoByTarget.get(`${uid}|${pkg}`);
  if (exact?.appLabel && exact.appLabel !== pkg) return exact;
  // Presentation-only fallback: the app label belongs to the installed APK and
  // is normally identical across Android users. Exact target metadata always wins.
  for (const [key, info] of state.infoByTarget) {
    if (key.endsWith(`|${pkg}`) && info?.appLabel && info.appLabel !== pkg) return info;
  }
  return exact || null;
}
function displayInfoFor(uid, pkg) {
  const live = state.infoByPackage.get(pkg);
  const cached = cachedInfoFor(uid, pkg);
  if (live?.appLabel && live.appLabel !== pkg) return { ...(cached || {}), ...live, packageName:pkg };
  if (cached) return { ...(live || {}), ...cached, packageName:pkg };
  return live || { packageName:pkg, appLabel:pkg, isSystem:false };
}
async function loadPersistentMetadata() {
  const res = await exec(scriptCommand('metadata_cache.sh', ['list']));
  if (res.errno !== 0) return;
  state.infoByTarget.clear();
  for (const line of (res.stdout || '').split(/\r?\n/)) {
    if (!line) continue;
    const parts = line.split('|');
    if (parts.length !== 4) continue;
    const [uid,pkg,label64,systemFlag] = parts;
    if (!/^\d+$/.test(uid) || !/^[A-Za-z0-9._]+$/.test(pkg)) continue;
    const label = decodeLabelBase64(label64);
    if (!label || label === pkg) continue;
    state.infoByTarget.set(`${uid}|${pkg}`, { packageName:pkg, appLabel:label, isSystem:systemFlag === '1', cached:true });
  }
}
async function persistSelectedMetadata({onlyUser=null}={}) {
  const rows = [];
  for (const key of state.selected) {
    const sep = key.indexOf('|');
    const uid = Number(key.slice(0, sep));
    const pkg = key.slice(sep + 1);
    if (onlyUser != null && uid !== Number(onlyUser)) continue;
    const live = state.infoByPackage.get(pkg);
    const existing = cachedInfoFor(uid, pkg);
    const info = live?.appLabel && live.appLabel !== pkg ? live : existing;
    const label = String(info?.appLabel || '');
    if (!label || label === pkg) continue;
    const label64 = encodeLabelBase64(label);
    if (!label64) continue;
    rows.push({ uid, pkg, label, label64, isSystem:Boolean(info?.isSystem) });
  }
  for (let i=0; i<rows.length; i+=30) {
    const chunk = rows.slice(i, i+30);
    const args = ['put'];
    for (const row of chunk) args.push(String(row.uid), row.pkg, row.label64, row.isSystem ? '1' : '0');
    const res = await exec(scriptCommand('metadata_cache.sh', args));
    if (res.errno !== 0 || !/^OK/m.test(res.stdout || '')) continue;
    for (const row of chunk) state.infoByTarget.set(`${row.uid}|${row.pkg}`, {
      packageName:row.pkg, appLabel:row.label, isSystem:row.isSystem, cached:true,
    });
  }
}
function escapeHtml(value) {
  return String(value).replaceAll('&','&amp;').replaceAll('<','&lt;').replaceAll('>','&gt;')
    .replaceAll('"','&quot;').replaceAll("'",'&#039;');
}
function shellQuote(value) { return `'${String(value).replaceAll("'", `'"'"'`)}'`; }
function scriptCommand(script, args=[]) {
  return `${MODULE_DIR}/bin/${script}${args.length ? ' ' + args.map(shellQuote).join(' ') : ''}`;
}
function selectedCount(userId=null) {
  let count = 0;
  for (const key of state.selected) {
    const uid = Number(key.slice(0, key.indexOf('|')));
    if (userId == null || uid === userId) count++;
  }
  return count;
}
function setsEqual(a,b) {
  if (a.size !== b.size) return false;
  for (const x of a) if (!b.has(x)) return false;
  return true;
}
function isDirty() { return !setsEqual(state.selected, state.savedSelected); }

function showMessage(text, error=false) {
  const el = $('message');
  clearTimeout(snackbarTimer);
  el.textContent = text;
  el.className = `snackbar show${error ? ' error' : ''}`;
  snackbarTimer = setTimeout(() => { el.className = 'snackbar'; }, error ? 5200 : 2600);
}
function formatError(raw) {
  const text = String(raw || '').trim();
  if (!text) return '操作失败';
  if (text.includes('BAD_PAIR|')) return `配置参数不完整：${text.split('BAD_PAIR|')[1] || ''}`;
  if (text.includes('BAD_TARGET|')) return `配置目标格式错误：${text.split('BAD_TARGET|')[1] || ''}`;
  if (text.includes('BAD_UID|')) return `用户空间 ID 无效：${text.split('BAD_UID|')[1] || ''}`;
  if (text.includes('BAD_PACKAGE|')) return `应用包名无效：${text.split('BAD_PACKAGE|')[1] || ''}`;
  if (text.includes('PROTECTED_PACKAGE|')) return '该应用属于 LS_Augment 保护范围，不能选择';
  if (text.includes('CONFIG_MISSING')) return '运行配置文件不存在，请重新保存配置';
  if (text.includes('CONFIG_UNREADABLE')) return '运行配置文件无法读取，请检查模块文件权限';
  if (text.includes('CONFIG_EMPTY')) return '运行配置为空，请先选择应用并保存配置';
  if (text.includes('CONFIG_INVALID')) return '运行配置格式无效，请重新保存配置';
  if (text.includes('CONFIG_ERROR')) return '读取运行配置失败';
  if (text.includes('RESTORE_REMOVED_TARGET_FAILED')) return '取消管理前解除隐藏失败，配置未修改；请先显示该应用';
  if (text.includes('ACTION_BUSY')) return '正在执行另一项隐藏/显示操作，请稍后再试';
  if (text.includes('LOCK_FAILED')) return '无法创建动作锁，请检查模块目录权限';
  if (text.includes('APK_MISSING')) return 'Companion APK 未内置于当前包；请安装完整构建或单独安装 Companion';
  if (text.includes('INSTALL_FAILED_UPDATE_INCOMPATIBLE')) return 'Companion APK 签名与已安装版本不一致';
  if (text.includes('Targeting R+') && text.includes('resources.arsc')) return 'Companion APK 对齐异常：resources.arsc 未按 Android R+ 要求进行 4 字节对齐';
  return text.replace(/^FAIL\|/,'').slice(0, 420);
}

async function loadConfig() {
  const res = await exec(scriptCommand('get_config.sh'));
  if (res.errno !== 0 && !res.stdout) throw new Error(res.stderr || '读取模块配置失败');
  state.selected.clear();
  state.targetState.clear();
  for (const line of res.stdout.split(/\r?\n/)) {
    if (!line) continue;
    const idx = line.indexOf('|');
    if (idx < 0) continue;
    const kind = line.slice(0, idx);
    const value = line.slice(idx + 1);
    if (kind === 'state') {
      const [s,total,visible,hidden,unknown] = value.split('|');
      state.actualState = s || 'error';
      state.total = Number(total || 0);
      state.visible = Number(visible || 0);
      state.hidden = Number(hidden || 0);
      state.unknown = Number(unknown || 0);
    } else if (kind === 'config') {
      const el = $('configSource');
      if (el) el.textContent = value || '/data/adb/ls_augment/targets.conf';
    } else if (kind === 'target' && /^\d+\|[A-Za-z0-9._]+$/.test(value)) {
      state.selected.add(value);
    } else if (kind === 'target_state') {
      const [uid,pkg,st] = value.split('|');
      if (/^\d+$/.test(uid) && /^[A-Za-z0-9._]+$/.test(pkg)) state.targetState.set(`${uid}|${pkg}`, st);
    }
  }
  state.savedSelected = new Set(state.selected);
  renderAllState();
}

async function loadAutomation() {
  const res = await exec(scriptCommand('automation.sh', ['get']));
  if (res.errno !== 0) throw new Error(res.stderr || '读取自动化设置失败');
  const values = {};
  for (const line of (res.stdout || '').split(/\r?\n/)) {
    const idx = line.indexOf('|');
    if (idx > 0) values[line.slice(0, idx)] = line.slice(idx + 1);
  }
  state.automationEnabled = values.enabled === '1';
  state.automationScope = values.scope === 'all' ? 'all' : 'current';
  state.automationRunning = values.running === '1';
  state.automationActive = values.active === '1';
  renderAutomation();
}

function renderAutomation() {
  const check = $('autoLockHide');
  const scope = $('autoScope');
  const badge = $('autoActive');
  const stateEl = $('automationState');
  const hint = $('automationHint');
  const summary = $('automationSummary');
  if (check) check.checked = state.automationEnabled;
  if (scope) scope.value = state.automationScope;
  if (badge) { badge.textContent = state.automationEnabled ? '已开启' : '未开启'; badge.className = `count-pill${state.automationEnabled ? ' enabled' : ''}`; }
  if (summary) summary.textContent = state.automationEnabled ? `已开启 · ${state.automationScope === 'all' ? '所有用户' : '当前用户'}` : '未开启';
  if (stateEl) stateEl.textContent = state.automationRunning ? '系统事件监听正常' : '监听服务尚未运行';
  if (hint) hint.textContent = state.automationActive ? '本次锁屏已执行隐藏；解锁后仍保持隐藏。' : '锁屏时执行隐藏，解锁不会自动恢复。';
}

async function saveAutomation() {
  const enabled = $('autoLockHide')?.checked ? '1' : '0';
  const scope = $('autoScope')?.value === 'all' ? 'all' : 'current';
  if (enabled === '1' && state.total === 0) throw new Error('请先在“应用”界面保存至少一个应用');
  const res = await exec(scriptCommand('automation.sh', ['set', enabled, scope]));
  if (res.errno !== 0 || !res.stdout.includes('OK|automation-saved')) throw new Error(formatError(res.stdout || res.stderr || '保存自动化设置失败'));
  await loadAutomation();
  showMessage(enabled === '1' ? '锁屏自动隐藏已开启' : '锁屏自动隐藏已关闭');
}

function pipeValues(output) {
  const values = {};
  for (const line of String(output || '').split(/\r?\n/)) {
    const index = line.indexOf('|');
    if (index > 0) values[line.slice(0, index)] = line.slice(index + 1);
  }
  return values;
}

async function loadUsers() {
  const res = await exec(scriptCommand('list_users.sh'));
  if (res.errno !== 0) throw new Error(res.stderr || '读取 Android 用户失败');
  const users = [];
  for (const line of res.stdout.split(/\r?\n/)) {
    const m = line.match(/^(\d+)\|(.*)$/);
    if (m) users.push({ id:Number(m[1]), name:m[2] || `用户 ${m[1]}` });
  }
  if (!users.length) users.push({ id:0, name:'主机' });
  state.users = users;
  if (!users.some((u) => u.id === state.activeUser)) {
    state.activeUser = users.find((u) => u.id === 0)?.id ?? users[0].id;
  }
  renderUsers();
}

async function loadPackagesForUser(userId, force=false) {
  const cacheKey = `${userId}:${state.showSystem ? 'all' : 'third'}`;
  if (!force && state.packagesByUser.has(cacheKey)) {
    const cached = state.packagesByUser.get(cacheKey);
    if (isInstallSort()) await ensureInstallTimes(userId, cached);
    renderApps(cached);
    return;
  }
  $('appList').innerHTML = '<div class="empty">正在读取应用列表…</div>';
  const res = await exec(scriptCommand('list_packages.sh', [userId, state.showSystem ? 'all' : 'third']));
  if (res.errno !== 0) throw new Error(res.stderr || `读取用户 ${userId} 的应用失败`);
  const packages = new Set(res.stdout.split(/\r?\n/).filter((p) => /^[A-Za-z0-9._]+$/.test(p)));
  // pm hide may omit targets from ordinary package listings; keep saved targets visible in WebUI.
  for (const key of state.selected) {
    const [uid,pkg] = key.split('|');
    if (Number(uid) === userId) packages.add(pkg);
  }
  packages.delete(COMPANION_PKG);
  const list = [...packages];
  state.packagesByUser.set(cacheKey, list);
  await loadMetadata(userId, list);
  await persistSelectedMetadata({onlyUser:userId});
  if (isInstallSort()) await ensureInstallTimes(userId, list);
  renderApps(list);
}

async function loadMetadata(userId, packages) {
  const missing = packages.filter((p) => !state.infoByPackage.has(p));
  for (let i=0; i<missing.length; i+=80) {
    const chunk = missing.slice(i, i+80);
    const infos = getPackagesInfo(chunk);
    for (const info of infos) if (info?.packageName) state.infoByPackage.set(info.packageName, info);
    for (const pkg of chunk) {
      if (!state.infoByPackage.has(pkg)) state.infoByPackage.set(pkg, { packageName:pkg, appLabel:pkg, isSystem:false });
    }
    await new Promise((r) => setTimeout(r, 0));
  }
}

function isInstallSort() { return state.sortMode === 'install-desc' || state.sortMode === 'install-asc'; }
function installTimeFor(pkg) { return state.installTimeByPackage.get(pkg) || ''; }
function formatInstallTime(value) {
  const text = String(value || '').trim();
  if (!text) return '';
  const m = text.match(/^(\d{4}-\d{2}-\d{2})/);
  return m ? m[1] : text.slice(0, 16);
}
async function ensureInstallTimes(userId, packages) {
  const missing = packages.filter((pkg) => !state.installTimeByPackage.has(pkg));
  if (!missing.length || state.installTimeLoading) return;
  state.installTimeLoading = true;
  try {
    for (let i=0; i<missing.length; i+=50) {
      const chunk = missing.slice(i, i+50);
      const res = await exec(scriptCommand('package_times.sh', [String(userId), ...chunk]));
      if (res.errno !== 0) continue;
      const seen = new Set();
      for (const line of (res.stdout || '').split(/\r?\n/)) {
        if (!line) continue;
        const idx = line.indexOf('|');
        if (idx < 1) continue;
        const pkg = line.slice(0, idx);
        if (!/^[A-Za-z0-9._]+$/.test(pkg)) continue;
        state.installTimeByPackage.set(pkg, line.slice(idx + 1).trim());
        seen.add(pkg);
      }
      for (const pkg of chunk) if (!seen.has(pkg)) state.installTimeByPackage.set(pkg, '');
      await new Promise((r) => setTimeout(r, 0));
    }
  } finally {
    state.installTimeLoading = false;
  }
}
function compareName(a,b) {
  return String(a.appLabel || a.packageName).localeCompare(
    String(b.appLabel || b.packageName), 'zh-CN', { numeric:true, sensitivity:'base' }
  );
}
function comparePrimarySort(a,b) {
  if (state.sortMode === 'name-desc') return -compareName(a,b);
  if (state.sortMode === 'name-asc') return compareName(a,b);
  if (isInstallSort()) {
    const at = installTimeFor(a.packageName);
    const bt = installTimeFor(b.packageName);
    if (at && bt && at !== bt) return state.sortMode === 'install-desc' ? bt.localeCompare(at) : at.localeCompare(bt);
    if (at && !bt) return -1;
    if (!at && bt) return 1;
    return compareName(a,b);
  }
  return compareName(a,b);
}
function compareRows(a,b) {
  if (state.pinSelected) {
    const aKey = `${state.activeUser}|${a.packageName}`;
    const bKey = `${state.activeUser}|${b.packageName}`;
    const selectedDelta = Number(state.selected.has(bKey)) - Number(state.selected.has(aKey));
    if (selectedDelta) return selectedDelta;
  }
  return comparePrimarySort(a,b);
}

function renderAllState() {
  renderStatus();
  renderSelectionSummary();
  renderUsers();
}

function renderStatus() {
  const orb = $('stateBadge');
  const title = $('stateTitle');
  const detail = $('stateDetail');
  const hideBtn = $('hideNow');
  const showBtn = $('showNow');
  orb.className = 'status-orb';

  if (state.actualState === 'visible') {
    orb.classList.add('visible'); title.textContent = state.total ? '应用正在显示' : '尚未配置';
    detail.textContent = state.total ? `${state.visible}/${state.total} 个目标处于显示状态` : '选择应用并保存配置后即可控制';
  } else if (state.actualState === 'hidden') {
    orb.classList.add('hidden'); title.textContent = state.total ? '应用已隐藏' : '尚未配置';
    detail.textContent = state.total ? `${state.hidden}/${state.total} 个目标处于 pm hide 状态` : '选择应用并保存配置后即可控制';
  } else if (state.actualState === 'mixed') {
    orb.classList.add('mixed'); title.textContent = '部分应用已隐藏';
    detail.textContent = `${state.hidden} 个隐藏 · ${state.visible} 个显示`;
  } else if (state.actualState === 'error') {
    orb.classList.add('error'); title.textContent = '状态检测不完整';
    detail.textContent = `${state.unknown} 个目标状态无法确认；隐藏/显示按钮仍按明确命令执行`;
  } else {
    orb.classList.add('neutral'); title.textContent = '尚未配置';
    detail.textContent = '选择应用并保存配置后即可控制';
  }
  const disabled = state.total === 0 || isDirty();
  hideBtn.disabled = disabled;
  showBtn.disabled = disabled;
}

function renderSelectionSummary() {
  const count = selectedCount();
  $('selectedPill').textContent = `${count} 个`;
  $('bottomCount').textContent = count ? `已选择 ${count} 个应用` : '未选择应用';
  $('dirtyText').textContent = isDirty() ? '有未保存的修改' : '配置已同步';
  $('save').disabled = !isDirty();
  $('save').textContent = isDirty() ? '保存配置' : '已保存';
  if ($('appListSummary')) $('appListSummary').textContent = count ? `${count} 个已选择 · 点击展开管理` : '点击展开管理应用';
  renderStatus();
}

function renderUsers() {
  if (!state.users.length) return;
  $('userTabs').innerHTML = state.users.map((u) => {
    const c = selectedCount(u.id);
    return `<button class="user-tab ${u.id===state.activeUser?'active':''}" data-user="${u.id}">
      <span>${escapeHtml(u.name)}</span><span class="uid">${u.id}</span><span class="user-count">${c}</span>
    </button>`;
  }).join('');
  const current = state.users.find((u) => u.id === state.activeUser);
  $('activeUserLabel').textContent = current ? `${current.name} · user ${current.id}` : '当前用户空间';
  document.querySelectorAll('.user-tab').forEach((el) => el.addEventListener('click', async () => {
    state.activeUser = Number(el.dataset.user);
    renderUsers();
    await guarded(() => loadPackagesForUser(state.activeUser));
  }));
}

function renderApps(packages) {
  const q = $('search').value.trim().toLocaleLowerCase('zh-CN');
  const tokens = q.split(/\s+/).filter(Boolean);
  const rows = packages
    .map((pkg) => displayInfoFor(state.activeUser, pkg))
    .filter((info) => {
      if (!tokens.length) return true;
      const haystack = `${info.appLabel || info.packageName} ${info.packageName}`.toLocaleLowerCase('zh-CN');
      return tokens.every((token) => haystack.includes(token));
    })
    .sort(compareRows);

  $('resultCount').textContent = q ? `${rows.length}/${packages.length}` : `${rows.length} 个`;
  if (!rows.length) { $('appList').innerHTML = '<div class="empty">没有匹配的应用</div>'; return; }
  $('appList').innerHTML = rows.map((info) => {
    const pkg = info.packageName;
    const key = `${state.activeUser}|${pkg}`;
    const checked = state.selected.has(key);
    const saved = state.savedSelected.has(key);
    const blocked = CRITICAL_PACKAGES.has(pkg);
    const label = info.appLabel || pkg;
    const st = state.targetState.get(key);
    let badge = '';
    if (checked && !saved) badge = '<span class="app-status pending">待保存</span>';
    else if (checked && st === 'hidden') badge = '<span class="app-status hidden">已隐藏</span>';
    else if (checked && st === 'visible') badge = '<span class="app-status visible">已显示</span>';
    else if (checked && st === 'unknown') badge = '<span class="app-status hidden">异常</span>';
    const initial = Array.from(String(label).trim())[0] || '□';
    const installText = isInstallSort() ? formatInstallTime(installTimeFor(pkg)) : '';
    return `<label class="app-row">
      <span class="app-icon-wrap"><span class="app-icon-fallback">${escapeHtml(initial)}</span><img class="app-icon" src="ksu://icon/${pkg}" alt="" onerror="this.style.display='none'"/></span>
      <span class="app-copy"><span class="app-name-line"><span class="app-name">${escapeHtml(label)}${info.isSystem?' · 系统':''}</span>${badge}</span><span class="app-pkg">${escapeHtml(pkg)}${blocked?' · 已保护':''}</span>${installText ? `<span class="app-install-time">安装：${escapeHtml(installText)}</span>` : ''}</span>
      <input class="app-check" type="checkbox" data-package="${escapeHtml(pkg)}" ${checked?'checked':''} ${blocked?'disabled':''}/>
    </label>`;
  }).join('');

  document.querySelectorAll('.app-check').forEach((box) => box.addEventListener('change', () => {
    const key = `${state.activeUser}|${box.dataset.package}`;
    box.checked ? state.selected.add(key) : state.selected.delete(key);
    renderSelectionSummary();
    renderUsers();
    renderApps(packages);
  }));
}

async function persistSelection({silent=false}={}) {
  await persistSelectedMetadata();
  const targets = [...state.selected]
    .filter((x) => /^\d+\|[A-Za-z0-9._]+$/.test(x))
    .sort((a,b) => a.localeCompare(b));
  // Do not put the '|' delimiter on the WebUI shell command line. Some
  // KernelSU/ROM execution chains re-parse it as a pipeline even when quoted.
  // Send only shell-safe UID/package pairs and rebuild UID|PACKAGE in the script.
  const args = [];
  for (const target of targets) {
    const sep = target.indexOf('|');
    args.push(target.slice(0, sep), target.slice(sep + 1));
  }
  const res = await exec(scriptCommand('save_config.sh', args));
  if (res.errno !== 0 || !/^OK\|\d+/m.test(res.stdout)) {
    throw new Error(formatError(res.stdout || res.stderr || '保存失败'));
  }
  state.savedSelected = new Set(state.selected);
  state.packagesByUser.clear();
  await loadConfig();
  renderSelectionSummary();
  await loadPackagesForUser(state.activeUser, true);
  await loadLog();
  if (!silent) showMessage(`配置文件已保存 ${targets.length} 个应用`);
}

async function runExplicitAction(script, expected) {
  if (state.total === 0) throw new Error('请先保存至少一个应用配置');
  if (isDirty()) throw new Error('当前选择有未保存修改，请先点击“保存配置”');

  if (expected === 'hidden') await persistSelectedMetadata();
  const res = await exec(scriptCommand(script));
  state.packagesByUser.clear();
  await loadConfig();
  await loadPackagesForUser(state.activeUser, true);
  await loadLog();

  if (res.errno !== 0) {
    throw new Error(formatError(res.stdout || res.stderr || '操作执行失败'));
  }
  // Command success is authoritative, matching the user's proven shell script.
  // Refreshed PackageManager state is display-only and never turns a successful
  // pm hide/unhide command into a false WebUI failure.
  showMessage(expected === 'hidden' ? '已执行隐藏指定应用' : '已执行显示指定应用');
}

async function restoreAllConfigured() {
  if (state.total === 0) throw new Error('当前没有已保存的应用配置');
  const res = await exec(scriptCommand('restore_all.sh'));
  state.packagesByUser.clear();
  await loadConfig();
  await loadPackagesForUser(state.activeUser, true);
  await loadLog();
  if (res.errno !== 0 || state.actualState !== 'visible') {
    throw new Error(formatError(res.stdout || res.stderr || '恢复已配置应用失败'));
  }
  showMessage('所有已配置应用已恢复显示');
}

async function loadTilePresentation() {
  const res = await exec(scriptCommand('tile_config.sh', ['get']));
  if (res.errno !== 0) return;
  const values = {};
  for (const line of (res.stdout || '').split(/\r?\n/)) {
    const idx = line.indexOf('|');
    if (idx > 0) values[line.slice(0, idx)] = line.slice(idx + 1);
  }
  const label = decodeLabelBase64(values.label64 || '') || 'LS_Augment';
  const description = decodeLabelBase64(values.description64 || '') || '应用隐藏';
  if ($('tileLabelInput')) $('tileLabelInput').value = label;
  if ($('tileDescriptionInput')) $('tileDescriptionInput').value = description;
}

async function saveTilePresentation() {
  const label = String($('tileLabelInput')?.value || '').trim() || 'LS_Augment';
  const description = String($('tileDescriptionInput')?.value || '').trim() || '应用隐藏';
  const res = await exec(scriptCommand('tile_config.sh', ['set', encodeLabelBase64(label), encodeLabelBase64(description)]));
  if (res.errno !== 0 || !res.stdout.includes('OK|tile-config-saved')) {
    throw new Error(formatError(res.stdout || res.stderr || '保存磁贴显示失败'));
  }
  showMessage('磁贴名称和说明已保存；下次展开控制中心时自动刷新。');
}

async function addTile() {
  const installed = await exec(`pm path ${COMPANION_PKG}`);
  if (installed.errno !== 0 || !installed.stdout.includes('package:')) await installCompanion({silent:true});
  const res = await exec(scriptCommand('tile_add.sh'));
  if (res.errno !== 0 || !res.stdout.includes('OK|tile-')) {
    throw new Error(formatError(res.stdout || res.stderr || '添加磁贴失败'));
  }
  showMessage('已启动系统磁贴添加请求；请在 SystemUI 弹窗中确认。');
}

async function installCompanion({silent=false}={}) {
  const res = await exec(scriptCommand('install_companion.sh'));
  if (res.errno !== 0 || !res.stdout.includes('OK|')) throw new Error(formatError(res.stdout || res.stderr || 'Companion 安装失败'));
  await loadCompanionStatus();
  if (!silent) showMessage('Companion 已安装 / 更新；请确认 LSPosed 已启用 Settings 与红魔游戏组件作用域。');
}

async function refreshSettingsHook() {
  const res = await exec(scriptCommand('refresh_settings.sh'));
  if (res.errno !== 0 || !res.stdout.includes('OK|')) throw new Error(formatError(res.stdout || res.stderr || '刷新 Settings 失败'));
  await loadCompanionStatus();
  showMessage('Settings 已停止。现在重新打开“设置 → 应用 → 应用管理”，再返回 WebUI 点击右上角刷新验证 Hook。');
}

async function loadCompanionStatus() {
  const res = await exec(scriptCommand('hook_status.sh'));
  const status = {};
  for (const line of (res.stdout || '').split(/\r?\n/)) {
    const [kind, ...rest] = line.split('|');
    status[kind] = rest.join('|');
  }
  const installed = status.companion === 'installed';
  const versionMatch = status.companion_match === '1';
  const versionRelation = status.version_relation || (versionMatch ? 'match' : 'unknown');
  const versionCompatible = versionMatch || versionRelation === 'module_older';
  const api102Ready = status.probe_api === '102' && status.probe_package_ready === '1';
  const hookInstalled = status.probe_hook_installed === '1';
  const filterCalled = status.probe_filter_called === '1';
  const hookSeen = hookInstalled || Boolean(status.hook);
  const mirrorCount = status.mirror ? status.mirror.split(';').filter(Boolean).length : 0;
  const strategy = status.hook_strategy || 'unknown';
  const lastFilter = status.hook_last_filter || '';
  const lastError = status.hook_last_error || '';
  const probeError = status.probe_error || '';
  const shoulderInstalled = status.shoulder_installed || '待加载';
  const shoulderHit = status.shoulder_last_hit || '尚未命中';
  const installedVersion = status.companion_version || 'unknown';
  const moduleVersion = status.module_version || 'unknown';
  $('companionTitle').textContent = !installed
    ? 'Companion 未安装'
    : versionRelation === 'module_older'
      ? `版本可兼容 · KernelSU ${moduleVersion} / Companion ${installedVersion}`
      : versionRelation === 'companion_older'
        ? `Companion 版本较旧 · ${installedVersion} → ${moduleVersion}`
        : !versionMatch
          ? `版本信息不一致 · KernelSU ${moduleVersion} / Companion ${installedVersion}`
      : hookInstalled
        ? 'API 102 Settings Hook 已安装'
        : api102Ready ? 'API 102 已加载 · Hook 待命中' : 'Companion 已安装 · API 102 待验证';
  $('companionHint').textContent = !installed
    ? '安装 Companion 后，在 LSPosed 中启用 LS_Augment；作用域包含 Settings、GameSpace、GameAssist 和 GameHelperModule。'
    : versionRelation === 'module_older'
      ? `Companion 比 KernelSU 模块新，现有 Core 功能可继续使用；如需同步新版 WebUI 与诊断能力，可选择更新 KernelSU 模块。`
      : versionRelation === 'companion_older'
        ? `当前 Companion ${installedVersion}，KernelSU 模块 ${moduleVersion}。请更新 Companion，再验证 LSPosed。`
        : !versionMatch
          ? `当前 Companion ${installedVersion}，KernelSU 模块 ${moduleVersion}。请将两者更新为同一发行版。`
      : hookSeen
        ? `API ${status.probe_api || '?'} · ${status.probe_framework || 'framework unknown'} · 路径 ${strategy} · 过滤回调 ${filterCalled ? '已触发' : '待触发'} · 肩键 ${shoulderInstalled} / ${shoulderHit} · 隐藏镜像 ${mirrorCount} 项${probeError ? ` · Probe ${probeError}` : ''}${lastError ? ` · 错误 ${lastError}` : ''}${lastFilter ? ` · 最近 ${lastFilter}` : ''}`
        : '请确认 LSPosed/Vector 支持 libxposed API 102 并启用 LS_Augment；作用域需包含 Settings、GameSpace、GameAssist 和 GameHelperModule。';
  $('companionDot').className = `health-dot${installed && versionCompatible && hookInstalled && !probeError && !lastError ? ' ok' : ''}`;
}

async function loadLog() {
  const res = await exec(scriptCommand('read_log.sh', ['action','100']));
  $('logView').textContent = (res.stdout || '').trim() || '暂无日志';
}
async function clearLog() {
  const res = await exec(scriptCommand('clear_log.sh'));
  if (res.errno !== 0) throw new Error(res.stderr || '清空日志失败');
  await loadLog();
  showMessage('日志已清空');
}

async function guarded(fn) {
  try { await fn(); }
  catch (e) { const text = formatError(e?.message || String(e)); showMessage(text, true); toast(text); }
}

let currentPage = 'overview';
async function openPage(page) {
  if (!['overview','apps','automation','tools'].includes(page)) page = 'overview';
  currentPage = page;
  document.querySelectorAll('[data-page-view]').forEach((el) => el.classList.toggle('active', el.dataset.pageView === page));
  document.querySelectorAll('.page-tab').forEach((el) => el.classList.toggle('active', el.dataset.page === page));
  document.querySelector('.bottom-bar')?.classList.toggle('app-save-hidden', page !== 'apps');
  try { localStorage.setItem('ls_augment_page', page); } catch (_) {}
  if (page === 'apps' && $('appListDetails')?.open) {
    await guarded(() => loadPackagesForUser(state.activeUser));
  }
}

try {
  const savedSort = localStorage.getItem('ls_augment_sort_mode');
  const savedPin = localStorage.getItem('ls_augment_pin_selected');
  // dev2.5 migration: "selected-first" meant pin selected + name ascending.
  if (savedSort === 'selected-first') {
    state.sortMode = 'name-asc';
    state.pinSelected = true;
  } else if (['name-asc','name-desc','install-desc','install-asc'].includes(savedSort)) {
    state.sortMode = savedSort;
  }
  if (savedPin === '1' || savedPin === '0') state.pinSelected = savedPin === '1';
} catch (_) {}
$('sortMode').value = state.sortMode;
$('pinSelected').checked = state.pinSelected;
$('sortMode').addEventListener('change', async () => {
  state.sortMode = $('sortMode').value;
  try { localStorage.setItem('ls_augment_sort_mode', state.sortMode); } catch (_) {}
  const key = `${state.activeUser}:${state.showSystem?'all':'third'}`;
  const packages = state.packagesByUser.get(key) || [];
  if (isInstallSort()) {
    $('resultCount').textContent = '读取安装时间…';
    await guarded(() => ensureInstallTimes(state.activeUser, packages));
  }
  renderApps(packages);
});
$('pinSelected').addEventListener('change', () => {
  state.pinSelected = $('pinSelected').checked;
  try { localStorage.setItem('ls_augment_pin_selected', state.pinSelected ? '1' : '0'); } catch (_) {}
  const key = `${state.activeUser}:${state.showSystem?'all':'third'}`;
  renderApps(state.packagesByUser.get(key) || []);
});

$('search').addEventListener('input', () => {
  const key = `${state.activeUser}:${state.showSystem?'all':'third'}`;
  renderApps(state.packagesByUser.get(key) || []);
});
$('showSystem').addEventListener('change', async () => {
  state.showSystem = $('showSystem').checked;
  if (state.showSystem && !confirm('系统应用可能影响桌面、设置或 SystemUI。确认显示系统应用吗？')) {
    $('showSystem').checked = false;
    state.showSystem = false;
  }
  await guarded(() => loadPackagesForUser(state.activeUser, true));
});
$('refresh').addEventListener('click', () => guarded(async () => {
  state.packagesByUser.clear(); state.infoByPackage.clear(); state.installTimeByPackage.clear();
  await loadPersistentMetadata(); await loadConfig(); await loadUsers();
  if ($('appListDetails')?.open) await loadPackagesForUser(state.activeUser, true);
  await loadAutomation(); await loadCompanionStatus(); await loadLog();
  showMessage('状态已刷新');
}));
$('save').addEventListener('click', () => guarded(() => persistSelection()));
$('hideNow').addEventListener('click', () => guarded(() => runExplicitAction('hide.sh','hidden')));
$('showNow').addEventListener('click', () => guarded(() => runExplicitAction('show.sh','visible')));
$('addTile').addEventListener('click', () => guarded(addTile));
$('saveTilePresentation').addEventListener('click', () => guarded(saveTilePresentation));
$('installCompanion').addEventListener('click', () => guarded(() => installCompanion()));
$('refreshSettings').addEventListener('click', () => guarded(() => refreshSettingsHook()));
$('restoreAll').addEventListener('click', () => guarded(restoreAllConfigured));
$('refreshLog').addEventListener('click', () => guarded(loadLog));
$('clearLog').addEventListener('click', () => guarded(clearLog));
$('saveAutomation').addEventListener('click', () => guarded(saveAutomation));
document.querySelectorAll('.page-tab').forEach((el) => el.addEventListener('click', () => guarded(() => openPage(el.dataset.page))));
document.querySelectorAll('[data-go-page]').forEach((el) => el.addEventListener('click', () => guarded(() => openPage(el.dataset.goPage))));
$('appListDetails').addEventListener('toggle', () => {
  try { localStorage.setItem('ls_augment_app_list_open', $('appListDetails').open ? '1' : '0'); } catch (_) {}
  if ($('appListDetails').open) guarded(() => loadPackagesForUser(state.activeUser));
});

await guarded(async () => {
  await loadConfig();
  await loadPersistentMetadata();
  await loadUsers();
  await loadAutomation();
  await loadCompanionStatus();
  await loadTilePresentation();
  await loadLog();
  let initialPage = 'overview';
  try { if (['overview','apps','automation','tools'].includes(localStorage.getItem('ls_augment_page'))) initialPage = localStorage.getItem('ls_augment_page'); } catch (_) {}
  try { if (localStorage.getItem('ls_augment_app_list_open') === '1') $('appListDetails').open = true; } catch (_) {}
  await openPage(initialPage);
});
