.class public final synthetic Lcom/android/launcher3/taskbar/D0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/M0;

.field public final synthetic h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic i:Ljava/lang/Runnable;

.field public final synthetic j:Landroid/graphics/RectF;

.field public final synthetic k:Landroid/view/View;

.field public final synthetic l:Lcom/android/launcher3/taskbar/l3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/M0;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/D0;->g:Lcom/android/launcher3/taskbar/M0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/D0;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/D0;->i:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/taskbar/D0;->j:Landroid/graphics/RectF;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/taskbar/D0;->k:Landroid/view/View;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/taskbar/D0;->l:Lcom/android/launcher3/taskbar/l3;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/D0;->g:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/D0;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/D0;->i:Ljava/lang/Runnable;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/taskbar/D0;->j:Landroid/graphics/RectF;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/taskbar/D0;->k:Landroid/view/View;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/taskbar/D0;->l:Lcom/android/launcher3/taskbar/l3;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    move-object v7, p2

    .line 15
    invoke-static/range {v0 .. v7}, Lcom/android/launcher3/taskbar/M0;->n(Lcom/android/launcher3/taskbar/M0;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method
