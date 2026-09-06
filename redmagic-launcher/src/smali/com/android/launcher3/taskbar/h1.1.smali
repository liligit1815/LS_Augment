.class public final synthetic Lcom/android/launcher3/taskbar/h1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/I1;

.field public final synthetic h:Lcom/android/launcher3/model/data/D;

.field public final synthetic i:Landroid/window/RemoteTransition;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/h1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/h1;->h:Lcom/android/launcher3/model/data/D;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/h1;->i:Landroid/window/RemoteTransition;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/h1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/h1;->h:Lcom/android/launcher3/model/data/D;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/h1;->i:Landroid/window/RemoteTransition;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/taskbar/I1;->q(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
