.class Lcom/android/launcher3/taskbar/bubbles/A0$a;
.super Landroid/view/ViewOutlineProvider;
.source "BubbleStashedHandleViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/A0;->o(Lcom/android/launcher3/taskbar/bubbles/m0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/A0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0$a;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0$a;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    int-to-float p1, p1

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr p1, v1

    .line 11
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->f(Lcom/android/launcher3/taskbar/bubbles/A0;F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0$a;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->b(Lcom/android/launcher3/taskbar/bubbles/A0;)Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0$a;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->c(Lcom/android/launcher3/taskbar/bubbles/A0;)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
