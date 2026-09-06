.class public final synthetic Lcom/android/launcher3/taskbar/bubbles/q0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LM2/i$c;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/bubbles/s0;

.field public final synthetic b:Landroid/graphics/PointF;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->a:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->b:Landroid/graphics/PointF;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->c:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->a:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->b:Landroid/graphics/PointF;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/q0;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    check-cast v3, Landroid/view/View;

    .line 9
    .line 10
    move-object v4, p2

    .line 11
    move v5, p3

    .line 12
    move v6, p4

    .line 13
    move v7, p5

    .line 14
    move/from16 v8, p6

    .line 15
    .line 16
    move/from16 v9, p7

    .line 17
    .line 18
    invoke-static/range {v0 .. v9}, Lcom/android/launcher3/taskbar/bubbles/s0;->a(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
