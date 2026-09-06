.class Lcom/android/launcher3/taskbar/e$a;
.super Ljava/lang/Object;
.source "FallbackTaskbarUIController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/e;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/e$a;->g:Lcom/android/launcher3/taskbar/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/e$a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e$a;->g:Lcom/android/launcher3/taskbar/e;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->BACKGROUND_APP:Lcom/android/quickstep/fallback/RecentsState;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/launcher3/taskbar/e;->U(Lcom/android/launcher3/taskbar/e;Lcom/android/quickstep/fallback/RecentsState;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    sget-object v3, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    .line 11
    .line 12
    if-ne p1, v3, :cond_1

    .line 13
    .line 14
    move v1, v2

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e$a;->g:Lcom/android/launcher3/taskbar/e;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    invoke-static {p0, v0, v1, v0}, Lcom/android/launcher3/taskbar/X4;->a(Lcom/android/launcher3/taskbar/R1;ZZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/e$a;->g:Lcom/android/launcher3/taskbar/e;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/e;->U(Lcom/android/launcher3/taskbar/e;Lcom/android/quickstep/fallback/RecentsState;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/e$a;->g:Lcom/android/launcher3/taskbar/e;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/e;->k()Lcom/android/quickstep/views/RecentsView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v1, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    new-instance p1, Lcom/android/launcher3/taskbar/d;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/d;-><init>(Lcom/android/launcher3/taskbar/e$a;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchListener(Lcom/android/quickstep/views/RecentsView$TaskLaunchListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/e$a;->c(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/e$a;->d(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
