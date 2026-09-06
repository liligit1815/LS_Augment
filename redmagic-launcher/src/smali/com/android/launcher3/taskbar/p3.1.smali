.class public final synthetic Lcom/android/launcher3/taskbar/p3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/q3;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/p3;->g:Lcom/android/launcher3/taskbar/q3;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/p3;->h:Landroid/view/View;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/taskbar/p3;->i:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/p3;->g:Lcom/android/launcher3/taskbar/q3;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/p3;->h:Landroid/view/View;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/p3;->i:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/taskbar/q3;->b(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
