.class public final synthetic Lcom/android/quickstep/f7;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/systemui/shared/recents/ISystemUiProxy;

.field public final synthetic b:Lcom/android/wm/shell/common/pip/a;

.field public final synthetic c:LJ2/a;

.field public final synthetic d:Lcom/android/wm/shell/splitscreen/a;

.field public final synthetic e:LL2/a;

.field public final synthetic f:Lcom/android/wm/shell/shared/l;

.field public final synthetic g:LV2/a;

.field public final synthetic h:Lcom/android/wm/shell/recents/a;

.field public final synthetic i:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

.field public final synthetic j:LI2/a;

.field public final synthetic k:Lcom/android/wm/shell/desktopmode/b;

.field public final synthetic l:Lcom/android/systemui/unfold/progress/a;

.field public final synthetic m:LK2/a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/f7;->a:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/f7;->b:Lcom/android/wm/shell/common/pip/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/f7;->c:LJ2/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/f7;->d:Lcom/android/wm/shell/splitscreen/a;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/f7;->e:LL2/a;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/f7;->f:Lcom/android/wm/shell/shared/l;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/quickstep/f7;->g:LV2/a;

    .line 17
    .line 18
    iput-object p8, p0, Lcom/android/quickstep/f7;->h:Lcom/android/wm/shell/recents/a;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/android/quickstep/f7;->i:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 21
    .line 22
    iput-object p10, p0, Lcom/android/quickstep/f7;->j:LI2/a;

    .line 23
    .line 24
    iput-object p11, p0, Lcom/android/quickstep/f7;->k:Lcom/android/wm/shell/desktopmode/b;

    .line 25
    .line 26
    iput-object p12, p0, Lcom/android/quickstep/f7;->l:Lcom/android/systemui/unfold/progress/a;

    .line 27
    .line 28
    iput-object p13, p0, Lcom/android/quickstep/f7;->m:LK2/a;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/f7;->a:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/f7;->b:Lcom/android/wm/shell/common/pip/a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/f7;->c:LJ2/a;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/f7;->d:Lcom/android/wm/shell/splitscreen/a;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/f7;->e:LL2/a;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/f7;->f:Lcom/android/wm/shell/shared/l;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/quickstep/f7;->g:LV2/a;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/android/quickstep/f7;->h:Lcom/android/wm/shell/recents/a;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/android/quickstep/f7;->i:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/android/quickstep/f7;->j:LI2/a;

    .line 20
    .line 21
    iget-object v10, p0, Lcom/android/quickstep/f7;->k:Lcom/android/wm/shell/desktopmode/b;

    .line 22
    .line 23
    iget-object v11, p0, Lcom/android/quickstep/f7;->l:Lcom/android/systemui/unfold/progress/a;

    .line 24
    .line 25
    iget-object v12, p0, Lcom/android/quickstep/f7;->m:LK2/a;

    .line 26
    .line 27
    move-object v13, p1

    .line 28
    check-cast v13, Lcom/android/quickstep/TouchInteractionService;

    .line 29
    .line 30
    invoke-static/range {v0 .. v13}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->w2(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;Lcom/android/quickstep/TouchInteractionService;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
