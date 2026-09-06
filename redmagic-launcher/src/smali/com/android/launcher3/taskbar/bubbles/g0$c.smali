.class Lcom/android/launcher3/taskbar/bubbles/g0$c;
.super Ljava/lang/Object;
.source "BubbleBarViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/g0;->w0(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/bubbles/g0$h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(LN2/h;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->t(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/t;->d3(LN2/h;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->z(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->V0(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$c;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Z0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
