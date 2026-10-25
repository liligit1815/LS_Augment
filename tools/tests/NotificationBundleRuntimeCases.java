// Included inside the existing registered-hook harness only for the modern Bundle fixture.
static void nativeBundleCases() {
    modes(true,false);FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");
    NotificationStackScrollLayout host=new NotificationStackScrollLayout();
    host.addView(row("left-old","same.app",0,false,1));host.addView(row("left-new","same.app",0,false,2));
    ExpandableNotificationRow bundle=row("native-bundle","unused",0,false,0);
    com.android.systemui.statusbar.notification.collection.BundleEntryAdapter adapter=new com.android.systemui.statusbar.notification.collection.BundleEntryAdapter(bundle);
    bundle.nativeAdapter=adapter;bundle.children.add(row("private-child","other.user",10,true,100));host.addView(bundle);
    host.addView(row("right-old","same.app",0,false,3));host.addView(row("right-new","same.app",0,false,4));frame(host);
    List<ExpandableNotificationRow> nativeClear=host.getRowsToDismissInBackend(1);
    FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");frame(host);
    visible(host,"left-new","native-bundle","right-new");
    int clicks=bundle.nativeClicks;tap(host,"native-bundle");
    check(bundle.nativeClicks==clicks+1,"Bundle first tap reaches original callback, never Duo expansion");
    bundle.nativeGroupExpand();check(bundle.expandedChildren==1&&bundle.children.size()==1,"native Bundle keeps expansion/children");
    check(host.getRowsToDismissInBackend(1).equals(nativeClear),"native Bundle clear selection identical with hidden ordinary rows");
    collapsedCancel(host,"left-new","left-old","left-new","native-bundle","right-new");
    check(bundle.visibility==View.VISIBLE&&bundle.alpha==1,"Bundle never hidden while ordinary segment opens");
    host.ambient.mStatusBarState=1;frame(host);
    visible(host,"left-old","left-new","native-bundle","right-old","right-new");noControls(host,"lockscreen Bundle stays native");host.ambient.mStatusBarState=0;
    // Real identity mismatches and unknown adapters must restore the whole list.
    adapter.key="wrong-key";frame(host);visible(host,"left-old","left-new","native-bundle","right-old","right-new");noControls(host,"mismatched Bundle identity");
    adapter.key=bundle.identity;adapter.entry.row=get(host,"right-new");frame(host);noControls(host,"mismatched Bundle row identity");
    adapter.entry.row=bundle;adapter.bundle=false;frame(host);noControls(host,"false native Bundle capability");
    adapter.bundle=true;bundle.nativeAdapter=new com.android.systemui.statusbar.notification.collection.EntryAdapter(){};frame(host);noControls(host,"unknown native adapter");
    bundle.nativeAdapter=adapter;frame(host);check(visible(host).contains("native-bundle"),"valid capability recovers after rejected structure");
    host.detach();check(bundle.children.size()==1&&bundle.alpha==1,"detach keeps original Bundle children/state");
    FeatureSettings.diagnostics.remove("ls_augment_notification_stack_runtime_error");
}
