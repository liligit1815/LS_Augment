.class public final synthetic Lcom/android/launcher3/taskbar/C;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Z

.field public final synthetic j:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/C;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/C;->h:Landroid/view/View;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/C;->i:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/launcher3/taskbar/C;->j:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/C;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/C;->h:Landroid/view/View;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/C;->i:Z

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/C;->j:Z

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
