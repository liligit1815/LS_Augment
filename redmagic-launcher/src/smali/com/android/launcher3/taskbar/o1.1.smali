.class public final synthetic Lcom/android/launcher3/taskbar/o1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/I1;

.field public final synthetic h:Ljava/lang/Runnable;

.field public final synthetic i:Lcom/android/quickstep/util/SingleTask;

.field public final synthetic j:Z

.field public final synthetic k:Landroid/window/RemoteTransition;

.field public final synthetic l:LO2/f;

.field public final synthetic m:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/I1;Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/o1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/o1;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/o1;->i:Lcom/android/quickstep/util/SingleTask;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/launcher3/taskbar/o1;->j:Z

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/taskbar/o1;->k:Landroid/window/RemoteTransition;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/taskbar/o1;->l:LO2/f;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/launcher3/taskbar/o1;->m:Ljava/lang/Runnable;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/o1;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/o1;->i:Lcom/android/quickstep/util/SingleTask;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/o1;->j:Z

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/taskbar/o1;->k:Landroid/window/RemoteTransition;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/taskbar/o1;->l:LO2/f;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/launcher3/taskbar/o1;->m:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/taskbar/I1;->U(Lcom/android/launcher3/taskbar/I1;Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
