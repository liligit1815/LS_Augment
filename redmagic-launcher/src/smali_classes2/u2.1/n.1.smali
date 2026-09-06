.class public final synthetic Lu2/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lu2/p$a;

.field public final synthetic h:Landroid/view/IRemoteAnimationRunner;

.field public final synthetic i:Landroid/window/TransitionInfo$Change;

.field public final synthetic j:Landroid/window/TransitionInfo$Change;

.field public final synthetic k:Lcom/android/wm/shell/shared/a;

.field public final synthetic l:Lcom/android/wm/shell/shared/a;

.field public final synthetic m:Landroid/window/TransitionInfo;

.field public final synthetic n:Landroid/util/ArrayMap;

.field public final synthetic o:Landroid/window/IRemoteTransitionFinishedCallback;


# direct methods
.method public synthetic constructor <init>(Lu2/p$a;Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/n;->g:Lu2/p$a;

    .line 5
    .line 6
    iput-object p2, p0, Lu2/n;->h:Landroid/view/IRemoteAnimationRunner;

    .line 7
    .line 8
    iput-object p3, p0, Lu2/n;->i:Landroid/window/TransitionInfo$Change;

    .line 9
    .line 10
    iput-object p4, p0, Lu2/n;->j:Landroid/window/TransitionInfo$Change;

    .line 11
    .line 12
    iput-object p5, p0, Lu2/n;->k:Lcom/android/wm/shell/shared/a;

    .line 13
    .line 14
    iput-object p6, p0, Lu2/n;->l:Lcom/android/wm/shell/shared/a;

    .line 15
    .line 16
    iput-object p7, p0, Lu2/n;->m:Landroid/window/TransitionInfo;

    .line 17
    .line 18
    iput-object p8, p0, Lu2/n;->n:Landroid/util/ArrayMap;

    .line 19
    .line 20
    iput-object p9, p0, Lu2/n;->o:Landroid/window/IRemoteTransitionFinishedCallback;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lu2/n;->g:Lu2/p$a;

    .line 2
    .line 3
    iget-object v1, p0, Lu2/n;->h:Landroid/view/IRemoteAnimationRunner;

    .line 4
    .line 5
    iget-object v2, p0, Lu2/n;->i:Landroid/window/TransitionInfo$Change;

    .line 6
    .line 7
    iget-object v3, p0, Lu2/n;->j:Landroid/window/TransitionInfo$Change;

    .line 8
    .line 9
    iget-object v4, p0, Lu2/n;->k:Lcom/android/wm/shell/shared/a;

    .line 10
    .line 11
    iget-object v5, p0, Lu2/n;->l:Lcom/android/wm/shell/shared/a;

    .line 12
    .line 13
    iget-object v6, p0, Lu2/n;->m:Landroid/window/TransitionInfo;

    .line 14
    .line 15
    iget-object v7, p0, Lu2/n;->n:Landroid/util/ArrayMap;

    .line 16
    .line 17
    iget-object v8, p0, Lu2/n;->o:Landroid/window/IRemoteTransitionFinishedCallback;

    .line 18
    .line 19
    invoke-static/range {v0 .. v8}, Lu2/p$a;->o2(Lu2/p$a;Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
