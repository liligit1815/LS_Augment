.class public final synthetic Lcom/android/launcher3/taskbar/bubbles/H;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field public final synthetic h:F

.field public final synthetic i:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/H;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/H;->h:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/H;->i:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/H;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/H;->h:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/H;->i:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->d(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;FF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
