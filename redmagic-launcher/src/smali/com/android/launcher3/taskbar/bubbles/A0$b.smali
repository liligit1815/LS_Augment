.class Lcom/android/launcher3/taskbar/bubbles/A0$b;
.super Ljava/lang/Object;
.source "BubbleStashedHandleViewController.java"

# interfaces
.implements LP2/d$d;


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
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0$b;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0$b;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->d(Lcom/android/launcher3/taskbar/bubbles/A0;)Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/StashedHandleView;->c(ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0$b;->a:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->d(Lcom/android/launcher3/taskbar/bubbles/A0;)Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/StashedHandleView;->getSampledRegion()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
