import catalog from './current-catalog.json';

/** Navigation groups can merge destinations without rewriting the Hook inventory. */
export const navigationTargets = catalog.targets
  .filter(target => target.id !== 'collab')
  .map(target => {
    if (target.id === 'systemui') return {
      ...target,
      title: '通知与控制中心',
      summary: '状态栏自定义、通知提醒与控制中心布局',
      sections: target.sections.filter(section => !['lockscreen', 'aod'].includes(section.id)),
    };
    if (target.id !== 'theme') return target;
    const collaboration = catalog.targets.find(item => item.id === 'collab');
    if (!collaboration) return target;
    const lockScreen = catalog.targets.find(item => item.id === 'systemui');
    return {
      ...target,
      title: '主题与锁屏',
      summary: '主题下载、联名主题、锁屏与息屏显示',
      packages: [...new Set([...target.packages, ...collaboration.packages, ...(lockScreen?.packages || [])])],
      restartScope: collaboration.restartScope,
      entries: [...target.entries, ...collaboration.entries],
      sections: [...target.sections, ...collaboration.sections,
        ...(lockScreen?.sections.filter(section => ['lockscreen', 'aod'].includes(section.id)) || [])],
    };
  });
