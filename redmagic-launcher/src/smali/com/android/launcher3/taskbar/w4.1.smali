.class public final synthetic Lcom/android/launcher3/taskbar/w4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/E4;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/E4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/w4;->g:Lcom/android/launcher3/taskbar/E4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/w4;->g:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/E4;->e(Lcom/android/launcher3/taskbar/E4;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
